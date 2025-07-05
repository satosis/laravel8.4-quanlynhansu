<?php
namespace App\Http\Controllers;

use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        return Inertia::render('Dashboard/Index');
    }

    public function baocao()
    {
        $now         = now();
        $thang_nay   = $now->month;
        $nam_nay     = $now->year;
        $thang_truoc = $thang_nay == 1 ? 12 : $thang_nay - 1;
        $nam_truoc   = $thang_nay == 1 ? $nam_nay - 1 : $nam_nay;

        // 1. Báo cáo sản xuất theo loại sản phẩm
        $danhmucs = \DB::table('danhmuc')->pluck('tensanpham', 'id');
        $sx_data  = \DB::table('san_phams')
            ->select('danhmuc_id', \DB::raw('MONTH(ngay_san_xuat) as thang'), \DB::raw('YEAR(ngay_san_xuat) as nam'), \DB::raw('SUM(so_luong_dat) as tong_san_xuat'))
            ->where(function ($q) use ($thang_nay, $nam_nay, $thang_truoc, $nam_truoc) {
                $q->where(function ($q2) use ($thang_nay, $nam_nay) {
                    $q2->whereMonth('ngay_san_xuat', $thang_nay)->whereYear('ngay_san_xuat', $nam_nay);
                })->orWhere(function ($q2) use ($thang_truoc, $nam_truoc) {
                    $q2->whereMonth('ngay_san_xuat', $thang_truoc)->whereYear('ngay_san_xuat', $nam_truoc);
                });
            })
            ->groupBy('danhmuc_id', 'nam', 'thang')
            ->get();

        $sx_categories = $danhmucs->values()->toArray();
        $sx_series     = [
            [
                'name' => "Tháng $thang_truoc/$nam_truoc",
                'data' => [],
            ],
            [
                'name' => "Tháng $thang_nay/$nam_nay",
                'data' => [],
            ],
        ];
        foreach ($danhmucs as $id => $name) {
            // Tháng trước
            $row_truoc = $sx_data->first(function ($item) use ($id, $thang_truoc, $nam_truoc) {
                return $item->danhmuc_id == $id && $item->thang == $thang_truoc && $item->nam == $nam_truoc;
            });
            $sx_series[0]['data'][] = $row_truoc ? (int) $row_truoc->tong_san_xuat : 0;
            // Tháng này
            $row_nay = $sx_data->first(function ($item) use ($id, $thang_nay, $nam_nay) {
                return $item->danhmuc_id == $id && $item->thang == $thang_nay && $item->nam == $nam_nay;
            });
            $sx_series[1]['data'][] = $row_nay ? (int) $row_nay->tong_san_xuat : 0;
        }

        // 2. Báo cáo lương nhân viên theo tháng
        $nhanviens = \DB::table('nhanvien')->pluck('hovaten', 'id');
        $months    = \DB::table('nhanluong')
            ->select(\DB::raw('CONCAT(thang, "/", nam) as thangnam'))
            ->groupBy('thang', 'nam')
            ->orderBy('nam')->orderBy('thang')
            ->pluck('thangnam')
            ->toArray();
        $luong_data = \DB::table('nhanluong')
            ->select('nhanvien_id', 'thang', 'nam', 'thuclinh')
            ->get();
        $luong_series = [];
        foreach ($nhanviens as $id => $name) {
            $values = [];
            foreach ($months as $thangnam) {
                [$thang, $nam] = explode('/', $thangnam);
                $row           = $luong_data->first(function ($item) use ($id, $thang, $nam) {
                    return $item->nhanvien_id == $id && $item->thang == $thang && $item->nam == $nam;
                });
                $values[] = $row ? (int) $row->thuclinh : 0;
            }
            $luong_series[] = [
                'name' => $name,
                'data' => $values,
            ];
        }

        // 3. Báo cáo số lượng nhân viên
        $dang_lam = \DB::table('nhanvien')->where('trangthai', 1)->count();
        $da_nghi  = \DB::table('nhanvien')->where('trangthai', 0)->count();
        $nam      = \DB::table('nhanvien')->where('gioitinh', 1)->count();
        $nu       = \DB::table('nhanvien')->where('gioitinh', 0)->count();

       return view('baocao.nhanvien_luong', [
            'sx_categories' => $sx_categories,
            'sx_series'     => $sx_series,
            'luong_months'  => $months,
            'luong_series'  => $luong_series,
            'dang_lam'      => $dang_lam,
            'da_nghi'       => $da_nghi,
            'nam'           => $nam,
            'nu'            => $nu,
        ]);
    }
}
