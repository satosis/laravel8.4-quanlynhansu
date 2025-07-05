<?php

namespace App\Http\Controllers;

use App\Models\DanhmucSanPham;
use App\Models\NhanVien;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DanhmucSanphamController extends Controller
{
    public function index()
    {
        return Inertia::render('Danhmuc/Index', [
            'filters' => Request::all('search', 'trashed'),
            'sanpham' => (new DanhmucSanPham())
                ->filter(Request::only('search', 'trashed'))
                ->paginate(10)
                ->withQueryString()
                ->through(fn ($sanpham) => [
                    'id' => $sanpham->id,
                    'tensanpham' => $sanpham->tensanpham,
                    'gia_tien' => $sanpham->gia_tien,
                    'deleted_at' => $sanpham->deleted_at,
                ]),
        ]);
    }

    public function create()
    {
       return Inertia::render('Danhmuc/Create');
    }

    public function store(Request $request)
    {
        Request::validate([
            'tensanpham' => ['required', 'max:255'],
            'gia_tien' => ['required', 'max:15'],
        ]);

        (new DanhmucSanPham())->create([
            'tensanpham' => Request::get('tensanpham'),
            'gia_tien' => Request::get('gia_tien'),
        ]);

        return Redirect::route('danhmuc')->with('success', 'Đã tạo thành công.');
    }

    public function edit(DanhmucSanPham $danhmuc)
    {
        return Inertia::render('Danhmuc/Edit', [
            'sanpham' => [
                'id' => $danhmuc->id,
                'tensanpham' => $danhmuc->tensanpham,
                'gia_tien' => $danhmuc->gia_tien,
                'deleted_at' => $danhmuc->deleted_at
            ],
        ]);
    }

    public function update(Request $request, DanhmucSanPham $danhmuc)
    {
        Request::validate([
            'tensanpham' => ['required', 'max:15'],
            'gia_tien' => ['required', 'max:15'],
        ]);

        $danhmuc->update([
            'tensanpham' => Request::get('tensanpham'),
            'gia_tien' => Request::get('gia_tien'),
        ]);

        return Redirect::back()->with('success', 'Đã cập nhật thành công.');
    }

    public function destroy(DanhmucSanPham $danhmuc)
    {
        $danhmuc->delete();

        return Redirect::back()->with('success', 'Đã xoá thành công.');
    }

    public function restore(DanhmucSanPham $danhmuc)
    {
        $danhmuc->restore();

        return Redirect::back()->with('success', 'Đã khôi phục thành công.');
    }
}
