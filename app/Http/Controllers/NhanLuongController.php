<?php

namespace App\Http\Controllers;

use App\Models\NhanLuong;
use App\Models\NhanVien;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\URL;
use App\Exports\NhanLuongExport;
use Inertia\Inertia;
use Excel;

class NhanLuongController extends Controller
{
    public function tinhLuong()
    {
        $nhanvien_id = Request::get('id');
        $thang = Request::get('thang');
        $nam = Request::get('nam');
        $ngaycong = Request::get('ngaycong');

        if (empty($nhanvien_id) || empty($thang) || empty($nam))
            return response()->json([]);

        if (!is_numeric($nhanvien_id) || !is_numeric($thang) || !is_numeric($nam))
            return response()->json([]);

        return response()->json((new NhanLuong())->tinhLuong($nhanvien_id, $thang, $nam));
    }

    public function index()
    {
        return Inertia::render('NhanLuong/Index', [
            'filters' => Request::all('search', 'trashed', 'ngayluong'),
            'nhanluong' => (new NhanLuong())
                ->filter(Request::only('search', 'trashed', 'ngayluong'))
                ->paginate(10)
                ->withQueryString()
                ->through(fn ($nhanluong) => [
                    'id' => $nhanluong->id,
                    'manv' => 'NV' . str_pad($nhanluong->nhanvien->id, 3, '0', STR_PAD_LEFT),
                    'hovaten' => $nhanluong->nhanvien->hovaten,
                    'thuclinh' => number_format($nhanluong->thuclinh) . ' VNĐ',
                    'ngaynhan' => str_pad($nhanluong->thang, 2, '0', STR_PAD_LEFT) . '-' . $nhanluong->nam,
                    'deleted_at' => $nhanluong->deleted_at,
                ]),
        ]);
    }

    public function create(NhanVien $nhanvien)
    {
        return Inertia::render('NhanLuong/Create', [
            'nhanvien' => [
                'id' => $nhanvien->id,
                'hovaten' => $nhanvien->hovaten
            ]
        ]);
    }

    public function store(NhanVien $nhanvien)
    {
        Request::validate([
            'thuong' => ['required'],
            'phat' => ['required'],
            'tien_sp' => ['required'],
            'thuclinh' => ['required'],
            'ngaynhan' => ['required', 'date'],
        ]);

        (new NhanLuong())->create([
            'nhanvien_id' => $nhanvien->id,
            'thuong' => Request::get('thuong'),
            'phat' => Request::get('phat'),
            'tien_sp' => Request::get('tien_sp'),
            'thuclinh' => Request::get('thuclinh'),
            'thang' => date('m', strtotime(Request::get('ngaynhan'))),
            'nam' => date('Y', strtotime(Request::get('ngaynhan'))),
        ]);

        return Redirect::route('nhanluong')->with('success', 'Đã tạo thành công.');
    }

    public function edit(NhanLuong $nhanluong)
    {
        return Inertia::render('NhanLuong/Edit', [
            'nhanluong' => [
                'id' => $nhanluong->id,
                'hovaten' => $nhanluong->nhanvien->hovaten,
                'thuong' => $nhanluong->thuong,
                'phat' => $nhanluong->phat,
                'tien_sp' => $nhanluong->tien_sp,
                'thuclinh' => $nhanluong->thuclinh,
                'ngaynhan' => $nhanluong->nam . '-' . str_pad($nhanluong->thang, 2, '0', STR_PAD_LEFT),
                'deleted_at' => $nhanluong->deleted_at,
            ],
        ]);
    }

    public function update(NhanLuong $nhanluong)
    {
        Request::validate([
            'thuong' => ['required'],
            'phat' => ['required'],
            'tien_sp' => ['required'],
            'thuclinh' => ['required'],
            'ngaynhan' => ['required', 'date'],
        ]);

        $nhanluong->update([
            'thuong' => Request::get('thuong'),
            'phat' => Request::get('phat'),
            'tien_sp' => Request::get('tien_sp'),
            'thuclinh' => Request::get('thuclinh'),
            'thang' => date('m', strtotime(Request::get('ngaynhan'))),
            'nam' => date('Y', strtotime(Request::get('ngaynhan'))),
        ]);

        return Redirect::back()->with('success', 'Đã cập nhật thành công.');
    }

    public function destroy(NhanLuong $nhanluong)
    {
        $nhanluong->delete();

        return Redirect::back()->with('success', 'Đã xoá thành công.');
    }

    public function restore(NhanLuong $nhanluong)
    {
        $nhanluong->restore();

        return Redirect::back()->with('success', 'Đã khôi phục thành công.');
    }

    public function export()
    {
        return Excel::download(new NhanLuongExport(Request::get('ngayluong')), 'danh-sach-nhan-luong.xlsx');
    }
}
