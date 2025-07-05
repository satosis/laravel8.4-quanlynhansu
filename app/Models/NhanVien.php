<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NhanVien extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'nhanvien';

    protected $fillable = [
        'hovaten',
        'gioitinh',
        'ngaysinh',
        'cmnd',
        'sdt',
        'diachi',
        'role',
        'quequan',
        'trangthai',
        'photo_path',
    ];

    public function resolveRouteBinding($value, $field = null)
    {
        return $this->where($field ?? 'id', $value)->withTrashed()->firstOrFail();
    }

    public function user()
    {
        return $this->hasOne(User::class, 'nhanvien_id', 'id')->withTrashed();
    }

    public function chamcong()
    {
        return $this->hasMany(NhanVien::class, 'id', 'nhanvien_id')->withTrashed();
    }


    public function thuongphat()
    {
        return $this->hasMany(ThuongPhat::class, 'id', 'nhanvien_id');
    }

    public function phanhoi()
    {
        return $this->hasMany(Phanhoi::class, 'id', 'nhanvien_id');
    }


    public function nhanluong()
    {
        return $this->hasMany(NhanLuong::class, 'id', 'nhanvien_id');
    }

    public function isNgayCong($id, $ngaycong)
    {
        return $this->join('chamcong as c', 'nhanvien.id', '=', 'c.nhanvien_id')
        ->where('c.created_at', $ngaycong . ' 00:00:00')
        ->where('nhanvien.id', $id)
        ->select('nhanvien.id')
        ->first();
    }

    public function ngayCongList(string $ngaycong)
    {
        $list = [];
        $temp = [];
        $nhanVien = $this->join('chamcong as c', 'nhanvien.id', '=', 'c.nhanvien_id')
        ->where('c.created_at', $ngaycong . ' 00:00:00')
        ->orderBy('nhanvien.id', 'ASC')
        ->select('nhanvien.id')
        ->get();
        foreach ($nhanVien as $nv)
            $list[$nv->id - 1] = true;
        if (count($list) > 0)
            for ($i = 0; $i <= max(array_keys($list)); $i++)
                $temp[$i] = $list[$i] ?? null;
        return $temp;
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->join('users as u', 'nhanvien.id', '=', 'u.nhanvien_id')
                  ->where('nhanvien.hovaten', 'like', '%'.$search.'%')
                  ->orWhere('nhanvien.sdt', 'like', '%'.$search.'%')
                  ->orWhere('u.email', 'like', '%'.$search.'%');
        })->when($filters['gioitinh'] ?? null, function ($query, $gioitinh) {
                $query->where('gioitinh', $gioitinh === 'nam' ? false : true);
        })->when($filters['trangthai'] ?? null, function ($query, $trangthai) {
                $query->where('trangthai', $trangthai === 'danghilam' ? false : true);
        })->when($filters['trashed'] ?? null, function ($query, $trashed) {
            if ($trashed === 'with') {
                $query->withTrashed();
            } elseif ($trashed === 'only') {
                $query->onlyTrashed();
            }
        });
    }
}
