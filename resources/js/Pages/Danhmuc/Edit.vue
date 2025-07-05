<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('danhmuc')">Danh mục sản phẩm</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        Chỉnh Sửa
      </h1>
    </div>
    <trashed-message v-if="sanpham.deleted_at" class="mb-6" @restore="restore">
      Danh mục sản phẩm này đã bị xoá.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.tensanpham" :error="form.errors.tensanpham" class="pr-6 sp-8 pb-8 w-full lg:w-1/1" label="Tên Sản phẩm" />
          <text-input v-model="form.gia_tien" :error="form.errors.gia_tien" class="pr-6 sp-8 pb-8 w-full lg:w-1/1" label="Giá tiền" />
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
      title: `Chỉnh Sửa Danh mục sản Phẩm`,
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
    sanpham: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        tensanpham: this.sanpham.tensanpham,
        gia_tien: this.sanpham.gia_tien
      })
    }
  },
  methods: {
    update() {
        this.form.post(this.route('danhmuc.update', this.sanpham.id))
    },
    destroy() {
        if (confirm('Bạn có chắc chắn muốn xoá không?')) {
            this.$inertia.delete(this.route('danhmuc.destroy', this.sanpham.id))
        }
    },
    restore() {
        if (confirm('Bạn có chắc chắn muốn khôi phục không?')) {
            this.$inertia.put(this.route('danhmuc.restore', this.sanpham.id))
        }
    },
  },
}
</script>
