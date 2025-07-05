<template>
  <div>
    <div class="mb-8 flex justify-between items-center">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('nhanvien')">Công nhân</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('nhanvien.edit', nhanvien.id)">{{ nhanvien.hovaten }}</inertia-link>
        <span class="text-indigo-400 font-medium">/</span> Nhận Lương
      </h1>
      <div>
         <button @click="TinhLuong" class="flex items-center btn-indigo" type="submit">Tính Lương</button>
      </div>
    </div>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="store">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.ngaynhan" :error="form.errors.ngaynhan" class="pr-6 pb-8 w-full lg:w-1/2" type="month" label="Tháng nhận" />
          <text-input v-model="form.thuong" :error="form.errors.thuong" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="Tiền thưởng" disabled/>
          <text-input v-model="form.phat" :error="form.errors.phat" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="Tiền phạt" disabled/>
          <text-input v-model="form.tien_sp" :error="form.errors.tien_sp" class="pr-6 pb-8 w-full lg:w-1/2" type="number" label="Tiền làm từ sản phẩm" disabled/>
          <text-input v-model="form.thuclinh" :error="form.errors.thuclinh" class="pr-6 pb-8 w-full" type="number" label="Thực lĩnh" disabled/>
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex justify-end items-center">
          <loading-button :loading="form.processing" class="btn-indigo" type="submit">Tạo Mới</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Layout from '@/Shared/Layout'
import TextInput from '@/Shared/TextInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'
export default {
  metaInfo: { title: 'Công nhân Nhận Lương' },
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
        thuong: null,
        phat: null,
        tien_sp: null,
        thuclinh: null,
        ngaynhan: null,
      }),
    }
  },
  methods: {
    store() {
        this.form.post(this.route('nhanluong.store', this.nhanvien.id))
    },
    TinhLuong()
    {
        if (this.form.ngaynhan == null)
        {
            alert('Vui lòng chọn ngày nhận lương.');
            return;
        }
        let ngay = this.form.ngaynhan.split('-');
        axios.get('/nhanluong/tinhluong?id=' + this.nhanvien.id + '&thang=' + ngay[1] + '&nam=' + ngay[0]).then(response => {
            this.form.thuong = response.data.thuong.toString();
            this.form.phat = response.data.phat.toString();
            this.form.tien_sp = response.data.tien_sp.toString();
            this.form.thuclinh = response.data.thuclinh.toString();
            alert('Đã tính lương thành công!');
        });
    },
  },
}
</script>
