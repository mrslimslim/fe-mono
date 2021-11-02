
<template>
  <div>
    <HelloWorld msg="monorepo PC-APP packages" />
    <StaffName />
    {{deptName}}
    <div>
      <span>a: </span>
      <div><input type="text" v-model="a"></div>
      <span>b: </span>
      <div><input type="text" v-model="b"></div>
      <span>result</span>
      <div>{{result}}</div>
    </div>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import StaffName from 'staff-name'
import { add } from 'public-utils'
import { DEPT_NAME, CENTER_NAME  } from 'constant'

export default {
  components: {
    HelloWorld,
    StaffName
  },
  data(){
    return {
      deptName: DEPT_NAME,
      centerName: CENTER_NAME,
      a: 0,
      b: 0,
      result: 0
    }
  },
  computed: {
    result(){
      return add(+this.a, +this.b)
    }
  }
}

</script>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
