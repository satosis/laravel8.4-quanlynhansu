<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('phanhoi')">Phản Hồi</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        {{ phanhoi.hovaten }}
      </h1>
    </div>
    <trashed-message v-if="phanhoi.deleted_at" class="mb-6" @restore="restore">
      Phản Hồi này đã bị xoá.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <select-input v-model="form.type_phan_hoi" disabled class="pr-6 pb-8 w-full" label="Loại phản hồi">
            <option :value="1">Phản hồi chấm công</option>
            <option :value="2">Phản hồi công việc</option>
            <option :value="3">Phản hồi khác</option>
          </select-input>
          <text-input v-model="form.noi_dung" disabled :error="form.errors.noi_dung" class="pr-6 pb-8 w-full" label="Nội dung" />
          <text-input v-model="form.giai_dap" :error="form.errors.giai_dap" class="pr-6 pb-8 w-full" label="Giải đáp" />

        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex items-center">
          <button v-if="!phanhoi.deleted_at && $page.props.auth.user.role == 1" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Xoá Phản Hồi</button>
          <loading-button :loading="form.processing"  v-if="$page.props.auth.user.role == 1" class="btn-indigo ml-auto" type="submit">Cập Nhật</loading-button>
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
      title: `${this.phanhoi.hovaten}`,
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
    phanhoi: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        type_phan_hoi: this.phanhoi.type_phan_hoi,
        noi_dung: this.phanhoi.noi_dung,
        giai_dap: this.phanhoi.giai_dap,
      })
    }
  },
  methods: {
    update() {
        this.form.post(this.route('phanhoi.update', this.phanhoi.id))
    },
    destroy() {
        if (confirm('Bạn có chắc chắn muốn xoá không?')) {
            this.$inertia.delete(this.route('phanhoi.destroy', this.phanhoi.id))
        }
    },
    restore() {
        if (confirm('Bạn có chắc chắn muốn khôi phục không?')) {
            this.$inertia.put(this.route('phanhoi.restore', this.phanhoi.id))
        }
    },
  },
}
</script>
