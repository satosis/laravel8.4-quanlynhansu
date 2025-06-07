<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SanPham extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'san_phams';

    public function resolveRouteBinding($value, $field = null)
    {
        return $this->where($field ?? 'id', $value)->withTrashed()->firstOrFail();
    }
    protected $fillable = [
        'nhan_vien_id',
        'ngay_san_xuat',
        'so_luong_dat',
        'so_luong_khong_dat',
        'ghi_chu',
        'nguoi_danh_gia_id'
    ];

    protected $casts = [
        'ngay_san_xuat' => 'date',
    ];

    public function nhanvien()
    {
        return $this->belongsTo(NhanVien::class, 'nhanvien_id', 'id');
    }

    public function nguoiDanhGia()
    {
        return $this->belongsTo(NhanVien::class, 'nguoi_danh_gia_id');
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->join('nhanvien as nv', 'san_phams.nhanvien_id', '=', 'nv.id')
                  ->where('nv.hovaten', 'like', '%'.$search.'%');
        })->when($filters['trashed'] ?? null, function ($query, $trashed) {
            if ($trashed === 'with') {
                $query->withTrashed();
            } elseif ($trashed === 'only') {
                $query->onlyTrashed();
            }
        });
    }
}
