<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('nhanvien')">Công nhân</inertia-link>
      <span class="text-indigo-400 font-medium">/</span>
      <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('nhanvien.edit', nhanvien.id)">{{ nhanvien.hovaten }}</inertia-link>
      <span class="text-indigo-400 font-medium">/</span> Phản Hồi
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="store">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <select-input v-model="form.type_phan_hoi" :error="form.errors.type_phan_hoi" class="pr-6 pb-8 w-full" label="Loại phản hồi">
            <option :value="1">Phản hồi chấm công</option>
            <option :value="2">Phản hồi công việc</option>
            <option :value="3">Phản hồi khác</option>
          </select-input>
          <text-input v-model="form.noi_dung" :error="form.errors.noi_dung" class="pr-6 pb-8 w-full" label="Nội dung" />
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
  metaInfo: { title: 'Phản Hồi Công nhân' },
  components: {
    LoadingButton,
    SelectInput,
    TextInput,
  },
  layout: Layout,
  props: {
    nhanvien: Object
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        type_phan_hoi: 1,
        noi_dung: null,
      }),
    }
  },
  methods: {
    store() {
        this.form.post(this.route('phanhoi.store'))
    },
  },
}
</script>
