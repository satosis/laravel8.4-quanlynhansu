<?php

namespace App\Exports;

use App\Models\NhanLuong;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithMapping;

class NhanLuongExport implements FromCollection,
                                WithHeadings,
                                WithCustomStartCell,
                                WithMapping
    {
    /**
    * @return \Illuminate\Support\Collection
    */

    private $ngaynhan;

    public function __construct(string $ngaynhan = null)
    {
        $this->ngaynhan = $ngaynhan;
    }

    public function headings(): array
    {
        return [
            'hovaten',
            'thuong',
            'phat',
            'thuclinh',
            'thang',
            'nam',
        ];
    }

    public function map($row): array
    {
        return [
            $row->hovaten,
            !empty($row->thuong) ? $row->thuong : '0',
            !empty($row->phat) ? $row->phat : '0',
            !empty($row->thuclinh) ? $row->thuclinh : '0',
            $row->thang,
            $row->nam,
        ];
    }

    public function startCell(): string
    {
        return 'A1';
    }

    public function collection()
    {
        if (!empty($this->ngaynhan))
        {
            $this->ngaynhan = explode('-', $this->ngaynhan);
            if (!empty($this->ngaynhan[0]) && !empty($this->ngaynhan[1]))
            {
                return (new NhanLuong())
                ->join('nhanvien as nv', 'nhanluong.nhanvien_id', '=', 'nv.id')
                ->where('thang', $this->ngaynhan[1])
                ->where('nam', $this->ngaynhan[0])
                ->get();
            }
        }
        return (new NhanLuong())
                ->join('nhanvien as nv', 'nhanluong.nhanvien_id', '=', 'nv.id')
                ->get();
    }
}
