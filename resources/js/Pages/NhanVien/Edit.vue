<template>
  <div>
    <div class="mb-8 flex justify-between items-center">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('nhanvien')">Công nhân</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        {{ form.hovaten }}
      </h1>
      <div>
        <inertia-link v-if="$page.props.auth.user.role == 1" class="btn-indigo" :href="route('thuongphat.create', nhanvien.id)">
            <span>Thưởng Phạt</span>
        </inertia-link>
        <inertia-link v-if="$page.props.auth.user.role == 2"  class="btn-indigo" :href="route('nhanluong.create', nhanvien.id)">
            <span>Nhận Lương</span>
        </inertia-link>
        <inertia-link v-if="$page.props.auth.user.role == 1"  class="btn-indigo" :href="route('chamcong', { nhanvien: nhanvien.id })">
            <span>Chấm Công</span>
        </inertia-link>
      </div>
    </div>
    <trashed-message v-if="nhanvien.deleted_at" class="mb-6" @restore="restore">
      Công nhân này đã bị xoá.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.hovaten" :error="form.errors.hovaten" class="pr-6 pb-8 w-full lg:w-1/2" label="Họ và tên" />
          <select-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.gioitinh" :error="form.errors.gioitinh" class="pr-6 pb-8 w-full lg:w-1/2" label="Giới tính">
            <option :value="null">- Chọn --</option>
            <option :value="0">Nam</option>
            <option :value="1">Nữ</option>
          </select-input>
          <select-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.trangthai" :error="form.errors.trangthai" class="pr-6 pb-8 w-full lg:w-1/2" label="Trạng thái làm việc">
            <option :value="null">- Chọn -</option>
            <option :value="0">Đã nghĩ việc</option>
            <option :value="1">Đang làm việc</option>
          </select-input>
          <text-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.ngaysinh" :error="form.errors.ngaysinh" class="pr-6 pb-8 w-full lg:w-1/2" type="date" label="Ngày sinh" />
          <text-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.sdt" :error="form.errors.sdt" class="pr-6 pb-8 w-full lg:w-1/2" label="Số điện thoại" />
          <text-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.cmnd" :error="form.errors.cmnd" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="CMND" />
          <text-input v-model="form.diachi" :error="form.errors.diachi" class="pr-6 pb-8 w-full lg:w-1/2" label="Địa chỉ" />
          <text-input v-model="form.quequan" :error="form.errors.quequan" class="pr-6 pb-8 w-full lg:w-1/2" label="Quê quán" />
          <select-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.role" :error="form.errors.role" class="pr-6 pb-8 w-full lg:w-1/2" label="Quyền hạn">
            <option :value="0">Công nhân</option>
            <option :value="1">Tổ trưởng</option>
            <option :value="2">Quản trị viên</option>
          </select-input>
          <file-input :disabled="$page.props.auth.user.role > 0 ? false : true" v-model="form.photo" :error="form.errors.photo" class="pr-6 pb-8 w-full lg:w-1/2" type="file" accept="image/*" label="Ảnh đại diện" />
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex items-center">
          <button v-if="!nhanvien.deleted_at && $page.props.auth.user.role == 2 && $page.props.auth.user.id != nhanvien.user_id" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Xoá Công nhân</button>
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Cập Nhật</loading-button>
        </div>
      </form>
    </div>

  </div>
</template>

<script>
import Icon from '@/Shared/Icon'
import Layout from '@/Shared/Layout'
import FileInput from '@/Shared/FileInput'
import TextInput from '@/Shared/TextInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'
import TrashedMessage from '@/Shared/TrashedMessage'

export default {
  metaInfo() {
    return {
      title: `${this.nhanvien.hovaten}`,
    }
  },
  components: {
    Icon,
    FileInput,
    LoadingButton,
    SelectInput,
    TextInput,
    TrashedMessage,
  },
  layout: Layout,
  props: {
    nhanvien: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        hovaten: this.nhanvien.hovaten,
        gioitinh: this.nhanvien.gioitinh,
        trangthai: this.nhanvien.trangthai,
        ngaysinh: this.nhanvien.ngaysinh,
        sdt: this.nhanvien.sdt,
        cmnd: this.nhanvien.cmnd,
        diachi: this.nhanvien.diachi,
        quequan: this.nhanvien.quequan,
        photo: null,
        role: this.nhanvien.role,
      })
    }
  },
  methods: {
    update() {
        this.form.post('/nhanvien/' + this.nhanvien.id, {
            onSuccess: () => this.form.reset('password', 'photo')
        })
    },
    destroy() {
        if (confirm('Bạn có chắc chắn muốn xoá không?')) {
            this.$inertia.delete(this.route('nhanvien.destroy', this.nhanvien.id))
        }
    },
    restore() {
        if (confirm('Bạn có chắc chắn muốn khôi phục không?')) {
            this.$inertia.put(this.route('nhanvien.restore', this.nhanvien.id))
        }
    },
  },
}
</script>
