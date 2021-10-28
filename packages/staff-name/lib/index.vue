<template>
  <div>
    <el-select v-model="value" placeholder="请选择">
        <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value"
        >
        </el-option>
    </el-select> 
  </div>
</template>

<script>
import { ref } from 'vue'
export default {
    setup(){
        return {
            options: ref([
                {
                    value: 'tengyu',
                    label: '吁腾',
                },
                {
                    value: 'kikoxiang',
                    label: '向阳君',
                },
                {
                    value: 'guoqinhuang',
                    label: '黄国庆',
                },
            ]),
            value: ref(''),
        }
    }
}
</script>

<style>

</style>