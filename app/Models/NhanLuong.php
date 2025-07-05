<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class NhanLuong extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'nhanluong';

    public function resolveRouteBinding($value, $field = null)
    {
        return $this->where($field ?? 'id', $value)->withTrashed()->firstOrFail();
    }

    public function countDate($start, $end)
    {
        return $this->getDay($end) - $this->getDay($start) + 1;
    }

    public function getDay($string)
    {
        return intval(date('d', strtotime($string)));
    }

    public function getMonth($string)
    {
        return intval(date('m', strtotime($string)));
    }

    public function getLastDay($string)
    {
        return intval(date('Y-m-t', strtotime($string)));
    }

    public function getSoSanPham($nhanvien_id, $month, $year)
    {
        $count = 0;

        $data = (new SanPham())
            ->with("danhmuc")
            ->where(function ($query) use ($nhanvien_id, $month, $year) {
                return $query
                    ->where('nhanvien_id', $nhanvien_id)
                    ->whereYear('ngay_san_xuat', $year)
                    ->whereMonth('ngay_san_xuat', $month);
            })->get();
        foreach ($data as $value) {
            $count += $value->so_luong_dat * ($value->danhmuc->gia_tien) - $value->so_luong_khong_dat * ($value->danhmuc->gia_tien);
        }

        return $count;
    }

    public function getThuongPhat($nhanvien_id, $month, $year, $loai = 1)
    {
        $tong       = 0;
        $thuongphat = (new ThuongPhat())->where('nhanvien_id', $nhanvien_id)
            ->where('loai', $loai)
            ->where('thang', $month)
            ->where('nam', $year)
            ->get();
        foreach ($thuongphat as $value) {
            $tong += $value['sotien'];
        }

        return $tong;
    }

    // thuclinh = (luongcb*heso + luongcb*heso*phucap)/ngaycongchuan*ngaycongthucte - ungtien (+-) thuongphat
    public function tinhluong($nhanvien_id, $month, $year)
    {
        $arr             = [];
        $arr['thuong']   = $this->getThuongPhat($nhanvien_id, $month, $year, 1);
        $arr['phat']     = $this->getThuongPhat($nhanvien_id, $month, $year, 0);
        $arr['tien_sp']  = $this->getSoSanPham($nhanvien_id, $month, $year);
        $arr['thuclinh'] = (int) ($arr['tien_sp'] + $arr['thuong'] - $arr['phat']);
        $arr['thuclinh'] = $arr['thuclinh'] <= 0 ? 0 : floor($arr['thuclinh']);
        return $arr;
    }

    public function nhanvien()
    {
        return $this->belongsTo(NhanVien::class, 'nhanvien_id', 'id');
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->join('nhanvien as nv', 'nhanluong.nhanvien_id', '=', 'nv.id')
                ->where('nv.hovaten', 'like', '%' . $search . '%');
            if (Auth::user()->role == 0) {
                $query = $query->where("nv.id", Auth::user()->nhanvien_id);
            }
        })->when($filters['ngayluong'] ?? null, function ($query, $ngayluong) {
            $ngayluong = explode('-', $ngayluong);
            $query->where('thang', $ngayluong[1])
                ->where('nam', $ngayluong[0]);
        })->when($filters['trashed'] ?? null, function ($query, $trashed) {
            if ($trashed === 'with') {
                $query->withTrashed();
            } elseif ($trashed === 'only') {
                $query->onlyTrashed();
            }
        });
    }
}
