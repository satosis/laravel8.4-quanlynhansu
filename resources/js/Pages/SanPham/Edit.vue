<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('sanpham')">Sản phẩm</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        Chỉnh Sửa
      </h1>
    </div>
    <trashed-message v-if="sanpham.deleted_at" class="mb-6" @restore="restore">
      Sản phẩm này đã bị xoá.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.tensanpham" :error="form.errors.tensanpham" class="pr-6 sp-8 pb-8 w-full lg:w-1/1" label="Sản phẩm" />
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
          <button v-if="!sanpham.deleted_at && $page.props.auth.user.role == 2" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Xoá Sản Phẩm</button>
          <loading-button :loading="form.processing" class="btn-indigo" type="submit">Cập Nhật</loading-button>
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
import TrashedMessage from '@/Shared/TrashedMessage'

export default {
  metaInfo() {
    return {
      title: `Chỉnh Sửa Sản Phẩm`,
    }
  },
  components: {
    LoadingButton,
    SelectInput,
    TextInput,
    TrashedMessage,
  },
  layout: Layout,
  props: {
    nhanviens: Array,
    sanpham: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        tensanpham: this.sanpham.tensanpham,
        nhanvien: this.sanpham.nhanvien,
        ngay_san_xuat: this.sanpham.ngay_san_xuat,
        so_luong_dat: this.sanpham.so_luong_dat,
        so_luong_khong_dat: this.sanpham.so_luong_khong_dat,
        ghi_chu: this.sanpham.ghi_chu
      })
    }
  },
  methods: {
    update() {
        this.form.post(this.route('sanpham.update', this.sanpham.id))
    },
    destroy() {
        if (confirm('Bạn có chắc chắn muốn xoá không?')) {
            this.$inertia.delete(this.route('sanpham.destroy', this.sanpham.id))
        }
    },
    restore() {
        if (confirm('Bạn có chắc chắn muốn khôi phục không?')) {
            this.$inertia.put(this.route('sanpham.restore', this.sanpham.id))
        }
    },
  },
}
</script>
