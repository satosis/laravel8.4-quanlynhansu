<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('sanpham')">Sản phẩm</inertia-link>
      <span class="text-indigo-400 font-medium">/</span> Thêm Mới
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="store">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <select-input v-model="form.danhmuc_id" :error="form.errors.danhmuc" class="pr-6 pb-8 w-full lg:w-1/2" label="Sản phẩm">
            <option :value="null">- Chọn -</option>
            <option v-for="pc in danhmuc" :key="pc.id" :value="pc.id">{{ pc.tensanpham }}</option>
          </select-input>
          <select-input v-model="form.nhanvien" :error="form.errors.nhanvien" class="pr-6 sp-8 pb-8 w-full lg:w-1/2" label="Nhân viên">
            <option :value="null">- Chọn -</option>
            <option v-for="sp in nhanviens" :key="sp.id" :value="sp.id">{{ sp.hovaten }}</option>
          </select-input>
          <text-input v-model="form.ngay_san_xuat" :error="form.errors.ngay_san_xuat" class="pr-6 sp-8 pb-8 w-full lg:w-1/2" type="date" label="Ngày sản xuất" />

          <text-input v-model="form.so_luong_dat" :error="form.errors.so_luong_dat" class="pr-6 sp-8 pb-8 w-full lg:w-1/2" type="text" label="Số lượng đạt" />
          <text-input v-model="form.so_luong_khong_dat" :error="form.errors.so_luong_khong_dat" class="pr-6 sp-8 pb-8 w-full lg:w-1/2" type="text" label="Số lượng không đạt" />
          <text-input v-model="form.ghi_chu" :error="form.errors.ghi_chu" class="pr-6 sp-8 pb-8 w-full lg:w-1/1" label="Ghi chú" />
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex justify-end items-center">
          <loading-button :loading="form.processing" class="btn-indigo" type="submit">Tạo Mới</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import TextInput from '@/Shared/TextInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'
export default {
  metaInfo: { title: 'Thêm Mới Sản Phẩm' },
  components: {
    LoadingButton,
    SelectInput,
    TextInput,
  },
  layout: Layout,
  props: {
    danhmuc: Array,
    nhanviens: Array,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        danhmuc_id: null,
        nhanvien: null,
        ngay_san_xuat: null,
        so_luong_dat: null,
        so_luong_khong_dat: null,
        ghi_chu: null,
      }),
    }
  },
  methods: {
    store() {
      this.form.post('/sanpham')
    },
  },
}
</script>
