<script setup>
import { ref } from 'vue'

defineProps({
  msg: String
})

const count = ref(0)
</script>

<template>
 <div>
   <div class="msg">{{msg}}</div>
  <button type="button" @click="count++">count is: {{ count }}</button>
 </div>
 
</template>

<style scoped>
.msg{
  font-size: 40px;
  font-weight: 700;
}
a {
  color: #42b983;
}
</style>
