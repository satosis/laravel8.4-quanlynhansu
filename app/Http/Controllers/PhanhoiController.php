<?php

namespace App\Http\Controllers;

use App\Models\Phanhoi;
use App\Models\NhanVien;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\URL;
use Inertia\Inertia;

class PhanhoiController extends Controller
{
    public function index()
    {
        return Inertia::render('PhanHoi/Index', [
            'filters' => Request::all('search', 'trashed'),
            'phanhoi' => (new Phanhoi())
                ->filter(Request::only('search', 'trashed'))
                ->paginate(10)
                ->withQueryString()
                ->through(fn ($phanhoi) => [
                    'id' => $phanhoi->id,
                    'manv' => 'NV' . str_pad($phanhoi->nhanvien->id, 3, '0', STR_PAD_LEFT),
                    'hovaten' => $phanhoi->nhanvien->hovaten,
                    'type_phan_hoi' => $phanhoi->typePhanHoi($phanhoi->type_phan_hoi),
                    'noi_dung' => $phanhoi->noi_dung,
                    'is_giaiquyet' => $phanhoi->is_giaiquyet,
                    'created_at' => $phanhoi->created_at,
                    'deleted_at' => $phanhoi->deleted_at,
                ]),
        ]);
    }

    public function create()
    {
        return Inertia::render('PhanHoi/Create', [
            'nhanvien' => [
                'id' => Auth::user()->nhanvien->id,
                'hovaten' => Auth::user()->nhanvien->hovaten
            ]
        ]);
    }

    public function store()
    {
        Request::validate([
            'type_phan_hoi' => ['required'],
            'noi_dung' => ['required', 'max:255']
        ]);
        $phanhoi = new Phanhoi();


        $phanhoi->create([
            'nhanvien_id' => Auth::user()->nhanvien->id,
            'type_phan_hoi' => Request::get('type_phan_hoi'),
            'noi_dung' => Request::get('noi_dung'),
            'is_giaiquyet' => 0
        ]);

        return Redirect::route('phanhoi')->with('success', 'Đã tạo thành công.');
    }

    public function edit(Phanhoi $phanhoi)
    {
        return Inertia::render('PhanHoi/Edit', [
            'phanhoi' => [
                'id' => $phanhoi->id,
                'hovaten' => $phanhoi->nhanvien->hovaten,
                'type_phan_hoi' => $phanhoi->type_phan_hoi,
                'noi_dung' => $phanhoi->noi_dung,
                'giai_dap' => $phanhoi->giai_dap,
                'is_giaiquyet' => $phanhoi->is_giaiquyet,
                'deleted_at' => $phanhoi->deleted_at,
            ],
        ]);
    }

    public function update(Phanhoi $phanhoi)
    {
        Request::validate([
            'giai_dap' => ['required', 'max:255']
        ]);

        $phanhoi->update([
            'giai_dap' => Request::get('giai_dap'),
            'is_giaiquyet' => 1,
        ]);

        return Redirect::back()->with('success', 'Đã cập nhật thành công.');
    }

    public function destroy(Phanhoi $phanhoi)
    {
        $phanhoi->delete();

        return Redirect::back()->with('success', 'Đã xoá thành công.');
    }

    public function restore(Phanhoi $phanhoi)
    {
        $phanhoi->restore();

        return Redirect::back()->with('success', 'Đã khôi phục thành công.');
    }
}
