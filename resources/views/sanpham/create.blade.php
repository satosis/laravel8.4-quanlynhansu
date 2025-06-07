<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Thêm thông tin sản phẩm</h5>
                </div>

                <div class="card-body">
                    <form method="POST" action="{{ route('sanpham.store') }}">
                        @csrf

                        <div class="form-group row mb-3">
                            <label for="nhan_vien_id" class="col-md-4 col-form-label text-md-right">Nhân viên</label>
                            <div class="col-md-6">
                                <select name="nhan_vien_id" id="nhan_vien_id" class="form-control @error('nhan_vien_id') is-invalid @enderror" required>
                                    <option value="">Chọn nhân viên</option>
                                    @foreach($nhanViens as $nhanVien)
                                        <option value="{{ $nhanVien->id }}">{{ $nhanVien->ho_ten }}</option>
                                    @endforeach
                                </select>
                                @error('nhan_vien_id')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label for="ngay_san_xuat" class="col-md-4 col-form-label text-md-right">Ngày sản xuất</label>
                            <div class="col-md-6">
                                <input type="date" name="ngay_san_xuat" id="ngay_san_xuat" class="form-control @error('ngay_san_xuat') is-invalid @enderror" value="{{ old('ngay_san_xuat') }}" required>
                                @error('ngay_san_xuat')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label for="so_luong_dat" class="col-md-4 col-form-label text-md-right">Số lượng đạt</label>
                            <div class="col-md-6">
                                <input type="number" name="so_luong_dat" id="so_luong_dat" class="form-control @error('so_luong_dat') is-invalid @enderror" value="{{ old('so_luong_dat') }}" min="0" required>
                                @error('so_luong_dat')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label for="so_luong_khong_dat" class="col-md-4 col-form-label text-md-right">Số lượng không đạt</label>
                            <div class="col-md-6">
                                <input type="number" name="so_luong_khong_dat" id="so_luong_khong_dat" class="form-control @error('so_luong_khong_dat') is-invalid @enderror" value="{{ old('so_luong_khong_dat') }}" min="0" required>
                                @error('so_luong_khong_dat')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label for="ghi_chu" class="col-md-4 col-form-label text-md-right">Ghi chú</label>
                            <div class="col-md-6">
                                <textarea name="ghi_chu" id="ghi_chu" class="form-control @error('ghi_chu') is-invalid @enderror" rows="3">{{ old('ghi_chu') }}</textarea>
                                @error('ghi_chu')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    Thêm mới
                                </button>
                                <a href="{{ route('sanpham.index') }}" class="btn btn-secondary">
                                    Quay lại
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
