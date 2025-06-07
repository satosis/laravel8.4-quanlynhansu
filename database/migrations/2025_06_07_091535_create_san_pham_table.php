<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSanPhamTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('san_phams', function (Blueprint $table) {
            $table->id();
            $table->text('tensanpham')->nullable();
            $table->unsignedInteger('nhanvien_id');
            $table->date('ngay_san_xuat');
            $table->integer('so_luong_dat');
            $table->integer('so_luong_khong_dat');
            $table->text('ghi_chu')->nullable();
            $table->unsignedInteger('nguoi_danh_gia_id');
            $table->foreign('nguoi_danh_gia_id','fk_san_phams_users_id')->references('id')->on('users')->onUpdate('CASCADE');
            $table->foreign('nhanvien_id','fk_san_phams_nhanvien_id')->references('id')->on('nhanvien')->onUpdate('CASCADE');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('san_phams');
    }
}
