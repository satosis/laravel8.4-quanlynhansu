<?php

namespace App\Http\Controllers;

use App\Models\SanPham;
use App\Models\DanhmucSanPham;
use App\Models\NhanVien;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class SanPhamController extends Controller
{
    public function index()
    {
        return Inertia::render('SanPham/Index', [
            'filters' => Request::all('search', 'trashed'),
            'sanpham' => (new SanPham())
                ->filter(Request::only('search', 'trashed'))
                ->paginate(10)
                ->withQueryString()
                ->through(fn ($sanpham) => [
                    'id' => $sanpham->id,
                    'manv' => 'NV' . str_pad($sanpham->nhanvien->id, 3, '0', STR_PAD_LEFT),
                    'tensanpham' => $sanpham->danhmuc->tensanpham,
                    'hovaten' => $sanpham->nhanvien->hovaten,
                    'ngay_san_xuat' => $sanpham->ngay_san_xuat,
                    'so_luong_dat' => $sanpham->so_luong_dat,
                    'so_luong_khong_dat' => $sanpham->so_luong_khong_dat,
                    'ghi_chu' => $sanpham->ghi_chu,
                    'nguoi_danh_gia' => str_pad($sanpham->nguoiDanhGia->hovaten, 3, '0', STR_PAD_LEFT),
                    'deleted_at' => $sanpham->deleted_at,
                ]),
        ]);
    }

    public function create()
    {
       return Inertia::render('SanPham/Create', [
            'nhanviens' => (new NhanVien())
                ->whereHas('user', function ($query) {
                    $query->where('role', 0);
                })
                ->orderBy('hovaten')
                ->get()
                ->map
                ->only('id', 'hovaten'),
            'danhmuc' => (new DanhmucSanPham())
                ->orderBy('tensanpham')
                ->get()
                ->map
                ->only('id', 'tensanpham')
        ]);
    }

    public function store(Request $request)
    {
        Request::validate([
            'nhanvien' => ['required', Rule::exists('nhanvien', 'id')],
            'ngay_san_xuat' => ['required', 'date'],
            'danhmuc_id' => ['required', 'max:255'],
            'so_luong_dat' => ['required', 'max:15'],
            'so_luong_khong_dat' => ['required', 'max:15'],
        ]);

        (new SanPham())->create([
            'danhmuc_id' => Request::get('danhmuc_id'),
            'nhanvien_id' => Request::get('nhanvien'),
            'ngay_san_xuat' => Request::get('ngay_san_xuat'),
            'so_luong_dat' => Request::get('so_luong_dat'),
            'so_luong_khong_dat' => Request::get('so_luong_khong_dat'),
            'ghi_chu' => Request::get('ghi_chu'),
            'nguoi_danh_gia_id' => Auth::user()->id,
        ]);

        return Redirect::route('sanpham')->with('success', 'Đã tạo thành công.');
    }

    public function edit(SanPham $sanpham)
    {
        return Inertia::render('SanPham/Edit', [
            'nhanviens' => (new NhanVien())
                ->orderBy('hovaten')
                ->get()
                ->map
                ->only('id', 'hovaten'),
            'danhmuc' => (new DanhmucSanPham())
                ->orderBy('tensanpham')
                ->get()
                ->map
                ->only('id', 'tensanpham'),
            'sanpham' => [
                'id' => $sanpham->id,
                'danhmuc_id' => $sanpham->danhmuc_id,
                'tensanpham' => $sanpham->tensanpham,
                'nhanvien' => $sanpham->nhanvien_id,
                'ngay_san_xuat' => $sanpham->ngay_san_xuat,
                'so_luong_dat' => $sanpham->so_luong_dat,
                'so_luong_khong_dat' => $sanpham->so_luong_khong_dat,
                'ghi_chu' => $sanpham->ghi_chu,
                'deleted_at' => $sanpham->deleted_at
            ],
        ]);
    }

    public function update(Request $request, SanPham $sanpham)
    {
        Request::validate([
            'nhanvien' => ['required', Rule::exists('nhanvien', 'id')],
            'danhmuc_id' => ['required', 'max:15'],
            'ngay_san_xuat' => ['required', 'date'],
            'so_luong_dat' => ['required', 'max:15'],
            'so_luong_khong_dat' => ['required', 'max:15'],
        ]);

        $sanpham->update([
            'danhmuc_id' => Request::get('danhmuc_id'),
            'nhanvien_id' => Request::get('nhanvien'),
            'ngay_san_xuat' => Request::get('ngay_san_xuat'),
            'so_luong_dat' => Request::get('so_luong_dat'),
            'so_luong_khong_dat' => Request::get('so_luong_khong_dat'),
            'ghi_chu' => Request::get('ghi_chu')
        ]);

        return Redirect::back()->with('success', 'Đã cập nhật thành công.');
    }

    public function destroy(SanPham $sanpham)
    {
        $sanpham->delete();

        return Redirect::back()->with('success', 'Đã xoá thành công.');
    }

    public function restore(SanPham $sanpham)
    {
        $sanpham->restore();

        return Redirect::back()->with('success', 'Đã khôi phục thành công.');
    }
}
