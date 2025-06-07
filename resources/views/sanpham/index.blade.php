<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Quản lý sản phẩm</h5>
                    <a href="{{ route('sanpham.create') }}" class="btn btn-primary">Thêm mới</a>
                </div>

                <div class="card-body">
                    @if (session('success'))
                        <div class="alert alert-success" role="alert">
                            {{ session('success') }}
                        </div>
                    @endif

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Nhân viên</th>
                                    <th>Ngày sản xuất</th>
                                    <th>Số lượng đạt</th>
                                    <th>Số lượng không đạt</th>
                                    <th>Ghi chú</th>
                                    <th>Người đánh giá</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($sanPhams as $sanPham)
                                <tr>
                                    <td>{{ $sanPham->nhanVien->ho_ten }}</td>
                                    <td>{{ $sanPham->ngay_san_xuat->format('d/m/Y') }}</td>
                                    <td>{{ $sanPham->so_luong_dat }}</td>
                                    <td>{{ $sanPham->so_luong_khong_dat }}</td>
                                    <td>{{ $sanPham->ghi_chu }}</td>
                                    <td>{{ $sanPham->nguoiDanhGia->name }}</td>
                                    <td>
                                        <a href="{{ route('sanpham.edit', $sanPham) }}" class="btn btn-sm btn-info">Sửa</a>
                                        <form action="{{ route('sanpham.destroy', $sanPham) }}" method="POST" class="d-inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</button>
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-center mt-4">
                        {{ $sanPhams->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
