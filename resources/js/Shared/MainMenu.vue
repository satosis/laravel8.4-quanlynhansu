<template>
  <div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('dashboard')">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Trang Chủ</div>
      </inertia-link>
    </div>
    <div v-if="$page.props.auth.user.role != 2" class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('bangchamcong')">
        <icon name="chamcong" class="w-4 h-4 mr-2" :class="isUrl('bangchamcong') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('bangchamcong') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Chấm Công</div>
      </inertia-link>
    </div>

    <div v-if="$page.props.auth.user.role == 2" class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('nhanvien')">
        <icon name="users" class="w-4 h-4 mr-2" :class="isUrl('nhanvien') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('nhanvien') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Báo cáo</div>
      </inertia-link>
    </div>
    <div v-if="$page.props.auth.user.role" class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('nhanvien')">
        <icon name="users" class="w-4 h-4 mr-2" :class="isUrl('nhanvien') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('nhanvien') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Nhân Viên</div>
      </inertia-link>
    </div>
    <div v-if="$page.props.auth.user.role == 1" class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('thuongphat')">
        <icon name="thuongphat" class="w-4 h-4 mr-2" :class="isUrl('thuongphat') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('thuongphat') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Thưởng Phạt</div>
      </inertia-link>
    </div>
    <div v-if="$page.props.auth.user.role == 1" class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('danhmuc')">
        <icon name="sanpham" class="w-4 h-4 mr-2" :class="isUrl('danhmuc') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('danhmuc') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Danh mục sản phẩm</div>
      </inertia-link>
    </div>
    <div v-if="$page.props.auth.user.role != 2" class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('sanpham')">
        <icon name="sanpham" class="w-4 h-4 mr-2" :class="isUrl('sanpham') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('sanpham') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Sản phẩm</div>
      </inertia-link>
    </div>
       <div v-if="$page.props.auth.user.role != 2" class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('phanhoi')">
        <icon name="phanhoi" class="w-4 h-4 mr-2" :class="isUrl('phanhoi') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('phanhoi') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Phản hồi</div>
      </inertia-link>
    </div>
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'

export default {
  components: {
    Icon,
  },
  methods: {
    isUrl(...urls) {
      let currentUrl = this.$page.url.substr(1)
      if (urls[0] === '') {
        return currentUrl === ''
      }
      return urls.filter(url => currentUrl.startsWith(url)).length
    },
  },
}
</script>
