<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Sản phẩm</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-md mr-4" @reset="reset">
        <label class="block text-gray-700">Trạng thái xoá:</label>
        <select v-model="form.trashed" class="mt-1 w-full form-select">
          <option :value="null">- Chưa chọn -</option>
          <option value="only">Đã xoá</option>
          <option value="with">Tất cả</option>
        </select>
      </search-filter>
      <inertia-link class="btn-indigo" :href="route('sanpham.create')">
        <span>Tạo Mới</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded shadow overflow-x-auto">
      <table class="w-full whitespace-no-wrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4">Mã nhân viên</th>
          <th class="px-6 pt-6 pb-4">Họ và tên</th>
          <th class="px-6 pt-6 pb-4">Sản phẩm</th>
          <th class="px-6 pt-6 pb-4">Ngày sản xuất</th>
          <th class="px-6 pt-6 pb-4">Số lượng đạt</th>
          <th class="px-6 pt-6 pb-4">Số lượng không đạt</th>
          <th class="px-6 pt-6 pb-4">Ghi chú</th>
          <th class="px-6 pt-6 pb-4" colspan="2">Người đánh giá	</th>
        </tr>
        <tr v-for="ul in sanpham.data" :key="ul.id" class="hover:bg-gray-100 focus-within:bg-gray-100">
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('sanpham.edit', ul.id)">
              {{ ul.manv }}
              <icon v-if="ul.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('sanpham.edit', ul.id)">
              {{ ul.hovaten }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('sanpham.edit', ul.id)" tabindex="-1">
              {{ ul.tensanpham }}
            </inertia-link>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('sanpham.edit', ul.id)" tabindex="-1">
              {{ ul.ngay_san_xuat }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('sanpham.edit', ul.id)" tabindex="-1">
              {{ ul.so_luong_dat }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('sanpham.edit', ul.id)" tabindex="-1">
              {{ ul.so_luong_khong_dat }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('sanpham.edit', ul.id)" tabindex="-1">
              {{ ul.ghi_chu }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('sanpham.edit', ul.id)" tabindex="-1">
              {{ ul.nguoi_danh_gia }}
            </inertia-link>
          </td>
          <td class="border-t w-px">
            <inertia-link class="px-4 flex items-center" :href="route('sanpham.edit', ul.id)" tabindex="-1">
              <icon name="cheveron-right" class="block w-6 h-6 fill-gray-400" />
            </inertia-link>
          </td>
        </tr>
        <tr v-if="sanpham.data.length === 0">
          <td class="border-t px-6 py-4" colspan="9">Không có sản phẩm nào cả.</td>
        </tr>
      </table>
    </div>
    <pagination :links="sanpham.links" />
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
  metaInfo: { title: 'Sản phẩm' },
  layout: Layout,
  components: {
    Icon,
    Pagination,
    SearchFilter,
  },
  props: {
    sanpham: Object,
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
        this.$inertia.replace(this.route('sanpham', Object.keys(query).length ? query : { remember: 'forget' }))
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
