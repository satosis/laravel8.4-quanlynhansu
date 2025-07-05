<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('nhanvien')">Công nhân</inertia-link>
      <span class="text-indigo-400 font-medium">/</span> Thêm Mới
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="store">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.hovaten" :error="form.errors.hovaten" class="pr-6 pb-8 w-full lg:w-1/2" label="Họ và tên" />
          <select-input v-model="form.gioitinh" :error="form.errors.gioitinh" class="pr-6 pb-8 w-full lg:w-1/2" label="Giới tính">
            <option :value="null">- Chọn -</option>
            <option :value="0">Nam</option>
            <option :value="1">Nữ</option>
          </select-input>
          <select-input v-model="form.trangthai" :error="form.errors.trangthai" class="pr-6 pb-8 w-full lg:w-1/2" label="Trạng thái làm việc">
            <option :value="null">- Chọn -</option>
            <option :value="0">Đã nghĩ việc</option>
            <option :value="1">Đang làm việc</option>
          </select-input>
          <text-input v-model="form.ngaysinh" :error="form.errors.ngaysinh" class="pr-6 pb-8 w-full lg:w-1/2" type="date" label="Ngày sinh" />
          <select-input v-model="form.role" :error="form.errors.role" class="pr-6 pb-8 w-full lg:w-1/2" label="Quyền hạn">
            <option :value="0">Công nhân</option>
            <option :value="1">Tổ trưởng</option>
            <option :value="2">Quản trị viên</option>
          </select-input>
          <text-input v-model="form.email" :error="form.errors.email" class="pr-6 pb-8 w-full lg:w-1/2" type="email" label="Email" />
          <text-input v-model="form.password" :error="form.errors.password" class="pr-6 pb-8 w-full lg:w-1/2" type="password" autocomplete="new-password" label="Mật khẩu" />
          <text-input v-model="form.sdt" :error="form.errors.sdt" class="pr-6 pb-8 w-full lg:w-1/2" label="Số điện thoại" />
          <text-input v-model="form.cmnd" :error="form.errors.cmnd" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="CMND" />
          <text-input v-model="form.diachi" :error="form.errors.diachi" class="pr-6 pb-8 w-full lg:w-1/2" label="Địa chỉ" />
          <text-input v-model="form.quequan" :error="form.errors.quequan" class="pr-6 pb-8 w-full lg:w-1/2" label="Quê quán" />
          <file-input v-model="form.photo" :error="form.errors.photo" class="pr-6 pb-8 w-full lg:w-1/2" type="file" accept="image/*" label="Ảnh đại diện" />
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
import FileInput from '@/Shared/FileInput'
import TextInput from '@/Shared/TextInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'
export default {
  metaInfo: { title: 'Thêm Mới Công nhân' },
  components: {
    FileInput,
    LoadingButton,
    SelectInput,
    TextInput,
  },
  layout: Layout,
  props: {

  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        hovaten: null,
        gioitinh: null,
        trangthai: null,
        role: null,
        ngaysinh: null,
        email: null,
        password: null,
        sdt: null,
        cmnd: null,
        diachi: null,
        quequan: null,
        photo: null,
      }),
    }
  },
  methods: {
    store() {
      this.form.post('/nhanvien')
    },
  },
}
</script>
