<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Phản hồi</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-md mr-4" @reset="reset">
        <label class="block text-gray-700">Trạng thái xoá:</label>
        <select v-model="form.trashed" class="mt-1 w-full form-select">
          <option :value="null">- Chưa chọn -</option>
          <option value="only">Đã xoá</option>
          <option value="with">Tất cả</option>
        </select>
      </search-filter>
      <inertia-link v-if="$page.props.auth.user.role != 2" class="btn-indigo" :href="route('phanhoi.create', filters.nhanvien)">
        <span>Tạo Mới</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded shadow overflow-x-auto">
      <table class="w-full whitespace-no-wrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4">Mã nhân viên</th>
          <th class="px-6 pt-6 pb-4">Họ và tên</th>
          <th class="px-6 pt-6 pb-4">Loại phản hồi</th>
          <th class="px-6 pt-6 pb-4">Nội dung</th>
          <th class="px-6 pt-6 pb-4">Tình trạng</th>
          <th class="px-6 pt-6 pb-4" colspan="2">Chi tiết</th>
        </tr>
        <tr v-for="nv in phanhoi.data" :key="nv.id" class="hover:bg-gray-100 focus-within:bg-gray-100">
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('phanhoi.edit', nv.id)">
              {{ nv.manv }}
              <icon v-if="nv.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('phanhoi.edit', nv.id)">
              {{ nv.hovaten }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('phanhoi.edit', nv.id)" tabindex="-1">
              {{ nv.type_phan_hoi ? 'Có' : 'Không' }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('phanhoi.edit', nv.id)" tabindex="-1">
              {{ nv.noi_dung }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link :class="['px-6 py-4 flex items-center', nv.is_giaiquyet ? 'text-success' : 'text-danger']" :href="route('phanhoi.edit', nv.id)" tabindex="-1">
              {{ nv.is_giaiquyet ? 'Đã giải đáp' : 'Chưa giải đáp' }}
            </inertia-link>
          </td>
          <td class="border-t w-px">
            <inertia-link class="px-4 flex items-center" :href="route('phanhoi.edit', nv.id)" tabindex="-1">
              <icon name="cheveron-right" class="block w-6 h-6 fill-gray-400" />
            </inertia-link>
          </td>
        </tr>
        <tr v-if="phanhoi.data.length === 0">
          <td class="border-t px-6 py-4" colspan="6">Không có phản hồi nào cả.</td>
        </tr>
      </table>
    </div>
    <pagination :links="phanhoi.links" />
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'
import Layout from '@/Shared/Layout'
import mapValues from 'lodash/mapValues'
import Pagination from '@/Shared/Pagination'
import pickBy from 'lodash/pickBy'
import SearchFilter from '@/Shared/SearchFilter'
import throttle from 'lodash/throttle'
export default {
  metaInfo: { title: 'Phản Hồi' },
  layout: Layout,
  components: {
    Icon,
    Pagination,
    SearchFilter,
  },
  props: {
    phanhoi: Object,
    filters: Object,
  },
  data() {
    return {
      form: {
        search: this.filters.search,
        trashed: this.filters.trashed,
      },
    }
  },
  watch: {
    form: {
      handler: throttle(function() {
        let query = pickBy(this.form)
        this.$inertia.replace(this.route('phanhoi', Object.keys(query).length ? query : { remember: 'forget' }))
      }, 150),
      deep: true,
    },
  },
  methods: {
    reset() {
      this.form = mapValues(this.form, () => null)
    },
  },
}
</script>
