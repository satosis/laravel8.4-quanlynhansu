<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('nhanluong')">Nhận Lương</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        {{ nhanluong.hovaten }}
      </h1>
    </div>
    <trashed-message v-if="nhanluong.deleted_at" class="mb-6" @restore="restore">
      Nhận lương này đã bị xoá.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.ngaynhan" :error="form.errors.ngaynhan" class="pr-6 pb-8 w-full lg:w-1/2" type="month" label="Tháng nhận" />
          <text-input v-model="form.thuong" :error="form.errors.thuong" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="Tiền thưởng" />
          <text-input v-model="form.phat" :error="form.errors.phat" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="Tiền phạt" />
          <text-input v-model="form.tien_sp" :error="form.errors.tien_sp" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="Tiền làm từ sản phẩm" />
          <text-input v-model="form.thuclinh" :error="form.errors.thuclinh" class="pr-6 pb-8 w-full lg:w-1/1" type="number" label="Thực lĩnh" />
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex items-center">
          <button v-if="!nhanluong.deleted_at && $page.props.auth.user.role == 2" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Xoá Nhận Lương</button>
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Cập Nhật</loading-button>
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
      title: `${this.nhanluong.hovaten}`,
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
    nhanluong: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        thuong: this.nhanluong.thuong,
        phat: this.nhanluong.phat,
        tien_sp: this.nhanluong.tien_sp,
        thuclinh: this.nhanluong.thuclinh,
        ngaynhan: this.nhanluong.ngaynhan,
      })
    }
  },
  methods: {
    update() {
        this.form.post(this.route('nhanluong.update', this.nhanluong.id))
    },
    destroy() {
        if (confirm('Bạn có chắc chắn muốn xoá không?')) {
            this.$inertia.delete(this.route('nhanluong.destroy', this.nhanluong.id))
        }
    },
    restore() {
        if (confirm('Bạn có chắc chắn muốn khôi phục không?')) {
            this.$inertia.put(this.route('nhanluong.restore', this.nhanluong.id))
        }
    },
  },
}
</script>
