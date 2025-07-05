<div class="container">
    <h2 class="mb-4">Tổng hợp báo cáo</h2>
    <div class="row">
        <div class="col-md-6">
            <h4>Báo cáo sản xuất theo loại sản phẩm</h4>
            <div id="chart-sanxuat"></div>
        </div>
        <div class="col-md-6">
            <h4>Báo cáo số lượng nhân viên</h4>
            <div id="chart-soluong"></div>
            <div id="chart-gioitinh" class="mt-4"></div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-12">
            <h4>Báo cáo tiền lương các nhân viên</h4>
            <div id="chart-luong"></div>
        </div>
    </div>
</div>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script>
Highcharts.chart('chart-sanxuat', {
    chart: { type: 'column' },
    title: { text: 'Sản xuất tháng này so với tháng trước' },
    xAxis: { categories: {!! json_encode($sx_categories) !!} },
    yAxis: { title: { text: 'Số lượng sản phẩm đạt' } },
    series: {!! json_encode($sx_series) !!}
});
Highcharts.chart('chart-luong', {
    chart: { type: 'column' },
    title: { text: 'Tiền lương các nhân viên theo tháng' },
    xAxis: { categories: {!! json_encode($luong_months) !!}, title: { text: 'Tháng/Năm' } },
    yAxis: { title: { text: 'Tổng lương (VNĐ)' } },
    series: {!! json_encode($luong_series) !!}
});
Highcharts.chart('chart-soluong', {
    chart: { type: 'pie' },
    title: { text: 'Trạng thái nhân viên' },
    series: [{
        name: 'Số lượng',
        colorByPoint: true,
        data: [
            { name: 'Đang làm việc', y: {{ $dang_lam }} },
            { name: 'Đã nghỉ', y: {{ $da_nghi }} }
        ]
    }]
});
Highcharts.chart('chart-gioitinh', {
    chart: { type: 'column' },
    title: { text: 'Giới tính nhân viên' },
    xAxis: { categories: ['Nam', 'Nữ'] },
    yAxis: { title: { text: 'Số lượng' } },
    series: [{
        name: 'Số lượng',
        data: [{{ $nam }}, {{ $nu }}]
    }]
});
</script>
