<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ImagesController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\NhanVienController;
use App\Http\Controllers\ChamCongController;
use App\Http\Controllers\BangCapController;
use App\Http\Controllers\ChucVuController;
use App\Http\Controllers\ChuyenMonController;
use App\Http\Controllers\DanTocController;
use App\Http\Controllers\LoaiBaoHiemController;
use App\Http\Controllers\NgoaiNguController;
use App\Http\Controllers\PhongBanController;
use App\Http\Controllers\TonGiaoController;
use App\Http\Controllers\PhuCapController;
use App\Http\Controllers\BaoHiemController;
use App\Http\Controllers\HopDongController;
use App\Http\Controllers\UngLuongController;
use App\Http\Controllers\NghiViecController;
use App\Http\Controllers\ThuongPhatController;
use App\Http\Controllers\HeSoController;
use App\Http\Controllers\BangChamCongController;
use App\Http\Controllers\NhanLuongController;
use App\Http\Controllers\KhauTruController;
use App\Http\Controllers\SanPhamController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Auth

Route::get('login', [AuthenticatedSessionController::class, 'create'])
    ->name('login')
    ->middleware('guest');

Route::post('login', [AuthenticatedSessionController::class, 'store'])
    ->name('login.store')
    ->middleware('guest');

Route::delete('logout', [AuthenticatedSessionController::class, 'destroy'])
    ->name('logout');

// Dashboard

Route::get('/', [DashboardController::class, 'index'])
    ->name('dashboard')
    ->middleware('auth');

// Users

Route::get('users', [UsersController::class, 'index'])
    ->name('users')
    ->middleware('check_admin_login');

Route::post('users', [UsersController::class, 'store'])
    ->name('users.store')
    ->middleware('check_admin_login');

Route::get('users/{user}/edit', [UsersController::class, 'edit'])
    ->name('users.edit')
    ->middleware('auth');

Route::put('users/{user}', [UsersController::class, 'update'])
    ->name('users.update')
    ->middleware('auth');

Route::delete('users/{user}', [UsersController::class, 'destroy'])
    ->name('users.destroy')
    ->middleware('check_admin_login');

Route::put('users/{user}/restore', [UsersController::class, 'restore'])
    ->name('users.restore')
    ->middleware('check_admin_login');

// NhanVien

Route::get('nhanvien', [NhanVienController::class, 'index'])
    ->name('nhanvien')
    ->middleware('check_to_truong_login');

Route::get('nhanvien/create', [NhanVienController::class, 'create'])
    ->name('nhanvien.create')
    ->middleware('check_to_truong_login');

Route::post('nhanvien', [NhanVienController::class, 'store'])
    ->name('nhanvien.store')
    ->middleware('check_to_truong_login');

Route::get('nhanvien/{nhanvien}/edit', [NhanVienController::class, 'edit'])
    ->name('nhanvien.edit')
    ->middleware('check_to_truong_login');

Route::put('nhanvien/{nhanvien}', [NhanVienController::class, 'update'])
    ->name('nhanvien.update')
    ->middleware('check_to_truong_login');

Route::delete('nhanvien/{nhanvien}', [NhanVienController::class, 'destroy'])
    ->name('nhanvien.destroy')
    ->middleware('check_to_truong_login');

Route::put('nhanvien/{nhanvien}/restore', [NhanVienController::class, 'restore'])
    ->name('nhanvien.restore')
    ->middleware('check_to_truong_login');

Route::post('nhanvien/import', [NhanVienController::class, 'import'])
    ->name('nhanvien.import')
    ->middleware('check_to_truong_login');

Route::get('nhanvien/export', [NhanVienController::class, 'export'])
    ->name('nhanvien.export')
    ->middleware('check_to_truong_login');

// Images

Route::get('/img/{path}', [ImagesController::class, 'show'])
    ->where('path', '.*')
    ->name('image');

// ChamCong
Route::get('chamcong', [ChamCongController::class, 'index'])
    ->name('chamcong')
    ->middleware('auth');

Route::get('chamcong/{nhanvien}/create', [ChamCongController::class, 'create'])
    ->name('chamcong.create')
    ->middleware('auth');

Route::get('chamcong/{chamcong}/edit', [ChamCongController::class, 'edit'])
    ->name('chamcong.edit')
    ->middleware('auth');

Route::post('chamcong/{nhanvien}', [ChamCongController::class, 'store'])
    ->name('chamcong.store')
    ->middleware('auth');

Route::put('chamcong/{chamcong}', [ChamCongController::class, 'update'])
    ->name('chamcong.update')
    ->middleware('auth');

Route::delete('chamcong/{chamcong}', [ChamCongController::class, 'destroy'])
    ->name('chamcong.destroy')
    ->middleware('auth');

Route::put('chamcong/{chamcong}/restore', [ChamCongController::class, 'restore'])
    ->name('chamcong.restore')
    ->middleware('auth');


// BangCap

Route::get('bangcap', [BangCapController::class, 'index'])
    ->name('bangcap')
    ->middleware('check_admin_login');

Route::get('bangcap/create', [BangCapController::class, 'create'])
    ->name('bangcap.create')
    ->middleware('check_admin_login');

Route::post('bangcap', [BangCapController::class, 'store'])
    ->name('bangcap.store')
    ->middleware('check_admin_login');

Route::get('bangcap/{bangcap}/edit', [BangCapController::class, 'edit'])
    ->name('bangcap.edit')
    ->middleware('check_admin_login');

Route::put('bangcap/{bangcap}', [BangCapController::class, 'update'])
    ->name('bangcap.update')
    ->middleware('check_admin_login');

Route::delete('bangcap/{bangcap}', [BangCapController::class, 'destroy'])
    ->name('bangcap.destroy')
    ->middleware('check_admin_login');

Route::put('bangcap/{bangcap}/restore', [BangCapController::class, 'restore'])
    ->name('bangcap.restore')
    ->middleware('check_admin_login');

// ChucVu

Route::get('chucvu', [ChucVuController::class, 'index'])
    ->name('chucvu')
    ->middleware('check_admin_login');

Route::get('chucvu/create', [ChucVuController::class, 'create'])
    ->name('chucvu.create')
    ->middleware('check_admin_login');

Route::post('chucvu', [ChucVuController::class, 'store'])
    ->name('chucvu.store')
    ->middleware('check_admin_login');

Route::get('chucvu/{chucvu}/edit', [ChucVuController::class, 'edit'])
    ->name('chucvu.edit')
    ->middleware('check_admin_login');

Route::put('chucvu/{chucvu}', [ChucVuController::class, 'update'])
    ->name('chucvu.update')
    ->middleware('check_admin_login');

Route::delete('chucvu/{chucvu}', [ChucVuController::class, 'destroy'])
    ->name('chucvu.destroy')
    ->middleware('check_admin_login');

Route::put('chucvu/{chucvu}/restore', [ChucVuController::class, 'restore'])
    ->name('chucvu.restore')
    ->middleware('check_admin_login');

// ChuyenMon

Route::get('chuyenmon', [ChuyenMonController::class, 'index'])
    ->name('chuyenmon')
    ->middleware('check_admin_login');

Route::get('chuyenmon/create', [ChuyenMonController::class, 'create'])
    ->name('chuyenmon.create')
    ->middleware('check_admin_login');

Route::post('chuyenmon', [ChuyenMonController::class, 'store'])
    ->name('chuyenmon.store')
    ->middleware('check_admin_login');

Route::get('chuyenmon/{chuyenmon}/edit', [ChuyenMonController::class, 'edit'])
    ->name('chuyenmon.edit')
    ->middleware('check_admin_login');

Route::put('chuyenmon/{chuyenmon}', [ChuyenMonController::class, 'update'])
    ->name('chuyenmon.update')
    ->middleware('check_admin_login');

Route::delete('chuyenmon/{chuyenmon}', [ChuyenMonController::class, 'destroy'])
    ->name('chuyenmon.destroy')
    ->middleware('check_admin_login');

Route::put('chuyenmon/{chuyenmon}/restore', [ChuyenMonController::class, 'restore'])
    ->name('chuyenmon.restore')
    ->middleware('check_admin_login');

// DanToc

Route::get('dantoc', [DanTocController::class, 'index'])
    ->name('dantoc')
    ->middleware('check_admin_login');

Route::get('dantoc/create', [DanTocController::class, 'create'])
    ->name('dantoc.create')
    ->middleware('check_admin_login');

Route::post('dantoc', [DanTocController::class, 'store'])
    ->name('dantoc.store')
    ->middleware('check_admin_login');

Route::get('dantoc/{dantoc}/edit', [DanTocController::class, 'edit'])
    ->name('dantoc.edit')
    ->middleware('check_admin_login');

Route::put('dantoc/{dantoc}', [DanTocController::class, 'update'])
    ->name('dantoc.update')
    ->middleware('check_admin_login');

Route::delete('dantoc/{dantoc}', [DanTocController::class, 'destroy'])
    ->name('dantoc.destroy')
    ->middleware('check_admin_login');

Route::put('dantoc/{dantoc}/restore', [DanTocController::class, 'restore'])
    ->name('dantoc.restore')
    ->middleware('check_admin_login');

// LoaiBaoHiem

Route::get('loaibaohiem', [LoaiBaoHiemController::class, 'index'])
    ->name('loaibaohiem')
    ->middleware('check_admin_login');

Route::get('loaibaohiem/create', [LoaiBaoHiemController::class, 'create'])
    ->name('loaibaohiem.create')
    ->middleware('check_admin_login');

Route::post('loaibaohiem', [LoaiBaoHiemController::class, 'store'])
    ->name('loaibaohiem.store')
    ->middleware('check_admin_login');

Route::get('loaibaohiem/{loaibaohiem}/edit', [LoaiBaoHiemController::class, 'edit'])
    ->name('loaibaohiem.edit')
    ->middleware('check_admin_login');

Route::put('loaibaohiem/{loaibaohiem}', [LoaiBaoHiemController::class, 'update'])
    ->name('loaibaohiem.update')
    ->middleware('check_admin_login');

Route::delete('loaibaohiem/{loaibaohiem}', [LoaiBaoHiemController::class, 'destroy'])
    ->name('loaibaohiem.destroy')
    ->middleware('check_admin_login');

Route::put('loaibaohiem/{loaibaohiem}/restore', [LoaiBaoHiemController::class, 'restore'])
    ->name('loaibaohiem.restore')
    ->middleware('check_admin_login');

// BaoHiem
Route::get('baohiem', [BaoHiemController::class, 'index'])
    ->name('baohiem')
    ->middleware('check_to_truong_login');

Route::get('baohiem/{nhanvien}/create', [BaoHiemController::class, 'create'])
    ->name('baohiem.create')
    ->middleware('check_to_truong_login');

Route::get('baohiem/{baohiem}/edit', [BaoHiemController::class, 'edit'])
    ->name('baohiem.edit')
    ->middleware('check_to_truong_login');

Route::post('baohiem/{nhanvien}', [BaoHiemController::class, 'store'])
    ->name('baohiem.store')
    ->middleware('check_to_truong_login');

Route::put('baohiem/{baohiem}', [BaoHiemController::class, 'update'])
    ->name('baohiem.update')
    ->middleware('check_to_truong_login');

Route::delete('baohiem/{baohiem}', [BaoHiemController::class, 'destroy'])
    ->name('baohiem.destroy')
    ->middleware('check_to_truong_login');

Route::put('baohiem/{baohiem}/restore', [BaoHiemController::class, 'restore'])
    ->name('baohiem.restore')
    ->middleware('check_to_truong_login');

// NgoaiNgu

Route::get('ngoaingu', [NgoaiNguController::class, 'index'])
    ->name('ngoaingu')
    ->middleware('check_admin_login');

Route::get('ngoaingu/create', [NgoaiNguController::class, 'create'])
    ->name('ngoaingu.create')
    ->middleware('check_admin_login');

Route::post('ngoaingu', [NgoaiNguController::class, 'store'])
    ->name('ngoaingu.store')
    ->middleware('check_admin_login');

Route::get('ngoaingu/{ngoaingu}/edit', [NgoaiNguController::class, 'edit'])
    ->name('ngoaingu.edit')
    ->middleware('check_admin_login');

Route::put('ngoaingu/{ngoaingu}', [NgoaiNguController::class, 'update'])
    ->name('ngoaingu.update')
    ->middleware('check_admin_login');

Route::delete('ngoaingu/{ngoaingu}', [NgoaiNguController::class, 'destroy'])
    ->name('ngoaingu.destroy')
    ->middleware('check_admin_login');

Route::put('ngoaingu/{ngoaingu}/restore', [NgoaiNguController::class, 'restore'])
    ->name('ngoaingu.restore')
    ->middleware('check_admin_login');

// PhongBan

Route::get('phongban', [PhongBanController::class, 'index'])
    ->name('phongban')
    ->middleware('check_admin_login');

Route::get('phongban/create', [PhongBanController::class, 'create'])
    ->name('phongban.create')
    ->middleware('check_admin_login');

Route::post('phongban', [PhongBanController::class, 'store'])
    ->name('phongban.store')
    ->middleware('check_admin_login');

Route::get('phongban/{phongban}/edit', [PhongBanController::class, 'edit'])
    ->name('phongban.edit')
    ->middleware('check_admin_login');

Route::put('phongban/{phongban}', [PhongBanController::class, 'update'])
    ->name('phongban.update')
    ->middleware('check_admin_login');

Route::delete('phongban/{phongban}', [PhongBanController::class, 'destroy'])
    ->name('phongban.destroy')
    ->middleware('check_admin_login');

Route::put('phongban/{phongban}/restore', [PhongBanController::class, 'restore'])
    ->name('phongban.restore')
    ->middleware('check_admin_login');

// TonGiao

Route::get('tongiao', [TonGiaoController::class, 'index'])
    ->name('tongiao')
    ->middleware('check_admin_login');

Route::get('tongiao/create', [TonGiaoController::class, 'create'])
    ->name('tongiao.create')
    ->middleware('check_admin_login');

Route::post('tongiao', [TonGiaoController::class, 'store'])
    ->name('tongiao.store')
    ->middleware('check_admin_login');

Route::get('tongiao/{tongiao}/edit', [TonGiaoController::class, 'edit'])
    ->name('tongiao.edit')
    ->middleware('check_admin_login');

Route::put('tongiao/{tongiao}', [TonGiaoController::class, 'update'])
    ->name('tongiao.update')
    ->middleware('check_admin_login');

Route::delete('tongiao/{tongiao}', [TonGiaoController::class, 'destroy'])
    ->name('tongiao.destroy')
    ->middleware('check_admin_login');

Route::put('tongiao/{tongiao}/restore', [TonGiaoController::class, 'restore'])
    ->name('tongiao.restore')
    ->middleware('check_admin_login');

// MucLuong

Route::get('phucap', [PhuCapController::class, 'index'])
    ->name('phucap')
    ->middleware('check_admin_login');

Route::get('phucap/create', [PhuCapController::class, 'create'])
    ->name('phucap.create')
    ->middleware('check_admin_login');

Route::post('phucap', [PhuCapController::class, 'store'])
    ->name('phucap.store')
    ->middleware('check_admin_login');

Route::get('phucap/{phucap}/edit', [PhuCapController::class, 'edit'])
    ->name('phucap.edit')
    ->middleware('check_admin_login');

Route::put('phucap/{phucap}', [PhuCapController::class, 'update'])
    ->name('phucap.update')
    ->middleware('check_admin_login');

Route::delete('phucap/{phucap}', [PhuCapController::class, 'destroy'])
    ->name('phucap.destroy')
    ->middleware('check_admin_login');

Route::put('phucap/{phucap}/restore', [PhuCapController::class, 'restore'])
    ->name('phucap.restore')
    ->middleware('check_admin_login');

// HopDong
Route::get('hopdong', [HopDongController::class, 'index'])
    ->name('hopdong')
    ->middleware('check_to_truong_login');

Route::get('hopdong/{nhanvien}/create', [HopDongController::class, 'create'])
    ->name('hopdong.create')
    ->middleware('check_to_truong_login');

Route::get('hopdong/{hopdong}/edit', [HopDongController::class, 'edit'])
    ->name('hopdong.edit')
    ->middleware('check_to_truong_login');

Route::post('hopdong/{nhanvien}', [HopDongController::class, 'store'])
    ->name('hopdong.store')
    ->middleware('check_to_truong_login');

Route::put('hopdong/{hopdong}', [HopDongController::class, 'update'])
    ->name('hopdong.update')
    ->middleware('check_to_truong_login');

Route::delete('hopdong/{hopdong}', [HopDongController::class, 'destroy'])
    ->name('hopdong.destroy')
    ->middleware('check_to_truong_login');

Route::put('hopdong/{hopdong}/restore', [HopDongController::class, 'restore'])
    ->name('hopdong.restore')
    ->middleware('check_to_truong_login');

// UngLuong
Route::get('ungluong', [UngLuongController::class, 'index'])
    ->name('ungluong')
    ->middleware('check_to_truong_login');

Route::get('ungluong/{nhanvien}/create', [UngLuongController::class, 'create'])
    ->name('ungluong.create')
    ->middleware('check_to_truong_login');

Route::get('ungluong/{ungluong}/edit', [UngLuongController::class, 'edit'])
    ->name('ungluong.edit')
    ->middleware('check_to_truong_login');

Route::post('ungluong/{nhanvien}', [UngLuongController::class, 'store'])
    ->name('ungluong.store')
    ->middleware('check_to_truong_login');

Route::put('ungluong/{ungluong}', [UngLuongController::class, 'update'])
    ->name('ungluong.update')
    ->middleware('check_to_truong_login');

Route::delete('ungluong/{ungluong}', [UngLuongController::class, 'destroy'])
    ->name('ungluong.destroy')
    ->middleware('check_to_truong_login');

Route::put('ungluong/{ungluong}/restore', [UngLuongController::class, 'restore'])
    ->name('ungluong.restore')
    ->middleware('check_to_truong_login');

// NhanLuong

Route::get('nhanluong/tinhluong', [NhanLuongController::class, 'tinhluong'])
    ->name('tinhluong')
    ->middleware('check_to_truong_login');

Route::get('nhanluong', [NhanLuongController::class, 'index'])
    ->name('nhanluong')
    ->middleware('check_to_truong_login');

Route::get('nhanluong/{nhanvien}/create', [NhanLuongController::class, 'create'])
    ->name('nhanluong.create')
    ->middleware('check_to_truong_login');

Route::get('nhanluong/{nhanluong}/edit', [NhanLuongController::class, 'edit'])
    ->name('nhanluong.edit')
    ->middleware('check_to_truong_login');

Route::post('nhanluong/{nhanvien}', [NhanLuongController::class, 'store'])
    ->name('nhanluong.store')
    ->middleware('check_to_truong_login');

Route::put('nhanluong/{nhanluong}', [NhanLuongController::class, 'update'])
    ->name('nhanluong.update')
    ->middleware('check_to_truong_login');

Route::delete('nhanluong/{nhanluong}', [NhanLuongController::class, 'destroy'])
    ->name('nhanluong.destroy')
    ->middleware('check_to_truong_login');

Route::put('nhanluong/{nhanluong}/restore', [NhanLuongController::class, 'restore'])
    ->name('nhanluong.restore')
    ->middleware('check_to_truong_login');

Route::get('nhanluong/export', [NhanLuongController::class, 'export'])
    ->name('nhanluong.export')
    ->middleware('check_to_truong_login');

// Khautru
Route::get('khautru', [KhauTruController::class, 'index'])
    ->name('khautru')
    ->middleware('check_to_truong_login');

Route::get('khautru/{khautru}/edit', [KhauTruController::class, 'edit'])
    ->name('khautru.edit')
    ->middleware('check_to_truong_login');

Route::put('khautru/{khautru}', [KhauTruController::class, 'update'])
    ->name('khautru.update')
    ->middleware('check_to_truong_login');

Route::delete('khautru/{khautru}', [KhauTruController::class, 'destroy'])
    ->name('khautru.destroy')
    ->middleware('check_to_truong_login');

Route::put('khautru/{khautru}/restore', [KhauTruController::class, 'restore'])
    ->name('khautru.restore')
    ->middleware('check_to_truong_login');

// NghiViec
Route::get('nghiviec', [NghiViecController::class, 'index'])
    ->name('nghiviec')
    ->middleware('check_to_truong_login');

Route::get('nghiviec/{nhanvien}/create', [NghiViecController::class, 'create'])
    ->name('nghiviec.create')
    ->middleware('check_to_truong_login');

Route::get('nghiviec/{nghiviec}/edit', [NghiViecController::class, 'edit'])
    ->name('nghiviec.edit')
    ->middleware('check_to_truong_login');

Route::post('nghiviec/{nhanvien}', [NghiViecController::class, 'store'])
    ->name('nghiviec.store')
    ->middleware('check_to_truong_login');

Route::put('nghiviec/{nghiviec}', [NghiViecController::class, 'update'])
    ->name('nghiviec.update')
    ->middleware('check_to_truong_login');

Route::delete('nghiviec/{nghiviec}', [NghiViecController::class, 'destroy'])
    ->name('nghiviec.destroy')
    ->middleware('check_to_truong_login');

Route::put('nghiviec/{nghiviec}/restore', [NghiViecController::class, 'restore'])
    ->name('nghiviec.restore')
    ->middleware('check_to_truong_login');

// NghiViec
Route::get('thuongphat', [ThuongPhatController::class, 'index'])
    ->name('thuongphat')
    ->middleware('check_to_truong_login');

Route::get('thuongphat/{nhanvien}/create', [ThuongPhatController::class, 'create'])
    ->name('thuongphat.create')
    ->middleware('check_to_truong_login');

Route::get('thuongphat/{thuongphat}/edit', [ThuongPhatController::class, 'edit'])
    ->name('thuongphat.edit')
    ->middleware('check_to_truong_login');

Route::post('thuongphat/{nhanvien}', [ThuongPhatController::class, 'store'])
    ->name('thuongphat.store')
    ->middleware('check_to_truong_login');

Route::put('thuongphat/{thuongphat}', [ThuongPhatController::class, 'update'])
    ->name('thuongphat.update')
    ->middleware('check_to_truong_login');

Route::delete('thuongphat/{thuongphat}', [ThuongPhatController::class, 'destroy'])
    ->name('thuongphat.destroy')
    ->middleware('check_to_truong_login');

Route::put('thuongphat/{thuongphat}/restore', [ThuongPhatController::class, 'restore'])
    ->name('thuongphat.restore')
    ->middleware('check_to_truong_login');


// heso
Route::get('heso', [HeSoController::class, 'index'])
    ->name('heso')
    ->middleware('check_admin_login');

Route::put('heso', [HeSoController::class, 'update'])
    ->name('heso.update')
    ->middleware('check_admin_login');


// bangchamcong
Route::get('bangchamcong', [BangChamCongController::class, 'index'])
    ->name('bangchamcong')
    ->middleware('check_admin_login');

Route::post('bangchamcong', [BangChamCongController::class, 'store'])
    ->name('bangchamcong.store')
    ->middleware('check_admin_login');


Route::get('sanpham', [SanPhamController::class, 'index'])
    ->name('sanpham')
    ->middleware('check_to_truong_login');

Route::get('sanpham/create', [SanPhamController::class, 'create'])
    ->name('sanpham.create')
    ->middleware('check_to_truong_login');

Route::get('sanpham/{sanpham}/edit', [SanPhamController::class, 'edit'])
    ->name('sanpham.edit')
    ->middleware('check_to_truong_login');

Route::post('sanpham/{nhanvien}', [SanPhamController::class, 'store'])
    ->name('sanpham.store')
    ->middleware('check_to_truong_login');

Route::put('sanpham/{sanpham}', [SanPhamController::class, 'update'])
    ->name('sanpham.update')
    ->middleware('check_to_truong_login');

Route::delete('sanpham/{sanpham}', [SanPhamController::class, 'destroy'])
    ->name('sanpham.destroy')
    ->middleware('check_to_truong_login');

Route::put('sanpham/{sanpham}/restore', [SanPhamController::class, 'restore'])
    ->name('sanpham.restore')
    ->middleware('check_to_truong_login');
