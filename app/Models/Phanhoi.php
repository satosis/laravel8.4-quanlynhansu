<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class Phanhoi extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'phan_hois';

    public function resolveRouteBinding($value, $field = null)
    {
        return $this->where($field ?? 'id', $value)->withTrashed()->firstOrFail();
    }

    public function nhanvien()
    {
        return $this->belongsTo(NhanVien::class, 'nhanvien_id', 'id');
    }

    public function typePhanHoi($type)
    {
        if ($type == 1) {
            return "Phản hồi chấm công";
        }
        if ($type == 2) {
            return "Phản hồi công việc";
        }
        return "Phản hồi khác";
    }

    public function scopeFilter($query, array $filters)
    {
        $query
            ->when($filters['search'] ?? null, function ($query, $search) {
                $query->where('noi_dung', 'like', '%' . $search . '%');
                if (Auth::user()->role == 0) {
                    $query = $query->where("nhanvien_id", Auth::user()->nhanvien_id);
                }
            })->when($filters['trashed'] ?? null, function ($query, $trashed) {
            if ($trashed === 'with') {
                $query->withTrashed();
            } elseif ($trashed === 'only') {
                $query->onlyTrashed();
            }
        });
    }
}
