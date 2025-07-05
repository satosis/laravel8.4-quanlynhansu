<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ImagesController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\NhanVienController;
use App\Http\Controllers\ChamCongController;
use App\Http\Controllers\PhanhoiController;
use App\Http\Controllers\ThuongPhatController;
use App\Http\Controllers\BangChamCongController;
use App\Http\Controllers\DanhmucSanphamController;
use App\Http\Controllers\NhanLuongController;
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
Route::get('/baocao', [DashboardController::class, 'baocao'])
    ->name('baocao')
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
    ->name('nhanvien.edit');

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
    ->middleware('check_to_truong_login');

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

// Phanhoi
Route::get('phanhoi', [PhanhoiController::class, 'index'])
    ->name('phanhoi');

Route::get('phanhoi/create', [PhanhoiController::class, 'create'])
    ->name('phanhoi.create');

Route::get('phanhoi/{phanhoi}/edit', [PhanhoiController::class, 'edit'])
    ->name('phanhoi.edit');

Route::post('phanhoi', [PhanhoiController::class, 'store'])
    ->name('phanhoi.store');

Route::put('phanhoi/{phanhoi}', [PhanhoiController::class, 'update'])
    ->name('phanhoi.update')
    ->middleware('check_to_truong_login');

Route::delete('phanhoi/{phanhoi}', [PhanhoiController::class, 'destroy'])
    ->name('phanhoi.destroy')
    ->middleware('check_to_truong_login');

Route::put('phanhoi/{phanhoi}/restore', [PhanhoiController::class, 'restore'])
    ->name('phanhoi.restore')
    ->middleware('check_to_truong_login');

// Thuongphat
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

// bangchamcong
Route::get('bangchamcong', [BangChamCongController::class, 'index'])
    ->name('bangchamcong');

Route::post('bangchamcong', [BangChamCongController::class, 'store'])
    ->name('bangchamcong.store')
    ->middleware('check_to_truong_login');


Route::get('sanpham', [SanPhamController::class, 'index'])
    ->name('sanpham');

Route::get('sanpham/create', [SanPhamController::class, 'create'])
    ->name('sanpham.create')
    ->middleware('check_to_truong_login');

Route::get('sanpham/{sanpham}/edit', [SanPhamController::class, 'edit'])
    ->name('sanpham.edit')
    ->middleware('check_to_truong_login');

Route::post('sanpham', [SanPhamController::class, 'store'])
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


Route::get('danhmuc', [DanhmucSanphamController::class, 'index'])
    ->name('danhmuc')
    ->middleware('check_to_truong_login');

Route::get('danhmuc/create', [DanhmucSanphamController::class, 'create'])
    ->name('danhmuc.create')
    ->middleware('check_to_truong_login');

Route::get('danhmuc/{danhmuc}/edit', [DanhmucSanphamController::class, 'edit'])
    ->name('danhmuc.edit')
    ->middleware('check_to_truong_login');

Route::post('danhmuc', [DanhmucSanphamController::class, 'store'])
    ->name('danhmuc.store')
    ->middleware('check_to_truong_login');

Route::put('danhmuc/{danhmuc}', [DanhmucSanphamController::class, 'update'])
    ->name('danhmuc.update')
    ->middleware('check_to_truong_login');

Route::delete('danhmuc/{danhmuc}', [DanhmucSanphamController::class, 'destroy'])
    ->name('danhmuc.destroy')
    ->middleware('check_to_truong_login');

Route::put('danhmuc/{danhmuc}/restore', [DanhmucSanphamController::class, 'restore'])
    ->name('danhmuc.restore')
    ->middleware('check_to_truong_login');
