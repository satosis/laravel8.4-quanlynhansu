<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('sanpham')">Sản phẩm</inertia-link>
      <span class="text-indigo-400 font-medium">/</span> Thêm Mới
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="store">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.tensanpham" :error="form.errors.tensanpham" class="pr-6 sp-8 pb-8 w-full lg:w-1/1" label="Tên sản phẩm" />
          <text-input v-model="form.gia_tien" :error="form.errors.gia_tien" class="pr-6 sp-8 pb-8 w-full lg:w-1/1" label="Giá tiền" />
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
  metaInfo: { title: 'Thêm Mới Danh mục Sản Phẩm' },
  components: {
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
        tensanpham: null,
        gia_tien: null,
      }),
    }
  },
  methods: {
    store() {
      this.form.post('/danhmuc')
    },
  },
}
</script>
