<?php

namespace App\Http\Controllers;

use App\Models\NhanVien;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\URL;
use Inertia\Inertia;
use App\Imports\NhanVienImport;
use App\Exports\NhanVienExport;
use Excel;

class NhanVienController extends Controller
{
    public function index()
    {
        return Inertia::render('NhanVien/Index', [
            'filters' => Request::all('search', 'trashed', 'gioitinh', 'trangthai'),
            'nhanvien' => Auth::user()->nhanvien
                ->latest('nhanvien.created_at')
                ->whereHas('user', function ($query) {
                    $query->where('role', 0);
                })
                ->filter(Request::only('search', 'trashed', 'gioitinh', 'trangthai'))
                ->paginate(10)
                ->withQueryString()
                ->through(fn ($nhanvien) => [
                    'id' => $nhanvien->id,
                    'manv' => 'NV' . str_pad($nhanvien->id, 3, '0', STR_PAD_LEFT),
                    'hovaten' => $nhanvien->hovaten,
                    'email' => $nhanvien->user->email,
                    'sdt' => $nhanvien->sdt,
                    'gioitinh' => $nhanvien->gioitinh,
                    'trangthai' => $nhanvien->trangthai,
                    'photo' => $nhanvien->photo_path ? URL::route('image', ['path' => $nhanvien->photo_path, 'w' => 40, 'h' => 40, 'fit' => 'crop']) : null,
                    'deleted_at' => $nhanvien->deleted_at,
                ]),
        ]);
    }

    public function create()
    {
        return Inertia::render('NhanVien/Create');
    }

    public function store()
    {
        Request::validate([
            'hovaten' => ['required', 'max:100'],
            'gioitinh' => ['required', 'boolean'],
            'ngaysinh' => ['required', 'date'],
            'role' => ['required', 'between:0,2'],
            'email' => ['required', 'max:100', 'email', Rule::unique('users', 'email')],
            'password' => ['required'],
            'sdt' => ['required', 'max:15'],
            'cmnd' => ['required', 'max:50'],
            'diachi' => ['nullable', 'max:255'],
            'quequan' => ['nullable', 'max:255'],
            'trangthai' => ['required', 'boolean'],
            'photo' => ['nullable', 'image']
        ]);

        Auth::user()->nhanvien->user->create([
            'nhanvien_id' => Auth::user()->nhanvien->create([
                'hovaten' => Request::get('hovaten'),
                'gioitinh' => Request::get('gioitinh'),
                'ngaysinh' => Request::get('ngaysinh'),
                'sdt' => Request::get('sdt'),
                'cmnd' => Request::get('cmnd'),
                'diachi' => Request::get('diachi'),
                'quequan' => Request::get('quequan'),
                'trangthai' => Request::get('trangthai'),
                'photo_path' => Request::file('photo') ? Request::file('photo')->store('nhanvien') : null,
            ])->id,
            'email' => Request::get('email'),
            'password' => Request::get('password'),
            'role' => Request::get('role')
        ]);

        return Redirect::route('nhanvien')->with('success', 'Đã tạo thành công.');
    }

    public function edit(NhanVien $nhanvien)
    {
        $user = User::where("nhanvien_id", $nhanvien->id)->first();
        return Inertia::render('NhanVien/Edit', [
            'nhanvien' => [
                'id' => $nhanvien->id,
                'user_id' => $nhanvien->user->id,
                'hovaten' => $nhanvien->hovaten,
                'gioitinh' => $nhanvien->gioitinh,
                'ngaysinh' => $nhanvien->ngaysinh,
                'sdt' => $nhanvien->sdt,
                'cmnd' => $nhanvien->cmnd,
                'diachi' => $nhanvien->diachi,
                'quequan' => $nhanvien->quequan,
                'trangthai' => $nhanvien->trangthai,
                'role' => $user->role,
                'photo' => $nhanvien->photo_path ? URL::route('image', ['path' => $nhanvien->photo_path, 'w' => 60, 'h' => 60, 'fit' => 'crop']) : null,
                'deleted_at' => $nhanvien->deleted_at,
            ],
        ]);
    }

    public function update(NhanVien $nhanvien)
    {
        Request::validate([
            'hovaten' => ['required', 'max:100'],
            'gioitinh' => ['required', 'boolean'],
            'ngaysinh' => ['required', 'date'],
            'sdt' => ['required', 'max:15'],
            'cmnd' => ['required', 'max:50'],
            'diachi' => ['nullable', 'max:255'],
            'quequan' => ['nullable', 'max:255'],
            'trangthai' => ['required', 'boolean'],
            'photo' => ['nullable', 'image']
        ]);

        $nhanvien->update([
            'hovaten' => Request::get('hovaten'),
            'gioitinh' => Request::get('gioitinh'),
            'ngaysinh' => Request::get('ngaysinh'),
            'sdt' => Request::get('sdt'),
            'cmnd' => Request::get('cmnd'),
            'diachi' => Request::get('diachi'),
            'quequan' => Request::get('quequan'),
            'trangthai' => Request::get('trangthai')
        ]);

        if (Request::file('photo')) {
            $nhanvien->update(['photo_path' => Request::file('photo')->store('users')]);
        }

        return Redirect::back()->with('success', 'Đã cập nhật thành công.');
    }

    public function destroy(NhanVien $nhanvien)
    {
        $nhanvien->delete();

        return Redirect::back()->with('success', 'Đã xoá thành công.');
    }

    public function restore(NhanVien $nhanvien)
    {
        $nhanvien->restore();

        return Redirect::back()->with('success', 'Đã khôi phục thành công.');
    }

    public function import()
    {
        Excel::import(new NhanVienImport, Request::file('file_import'));
        return redirect()->route('nhanvien');
    }

    public function export()
    {
        return Excel::download(new NhanVienExport, 'danh-sach-nhan-vien.xlsx');
    }
}
