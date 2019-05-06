<template>
  <div id="app">
    <h1>Watt-Age</h1>
    <h4> Find out how much energy your property has used over time </h4>
    <Dashboard></Dashboard>
  </div>
</template>

<script>
import Dashboard from '../components/Dashboard.vue'
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: {
    'Dashboard': Dashboard
  }
}
</script>

<style scoped>
h4 {
  text-align: center;
  margin-bottom: 50px;
}
h1 {
  text-align: center;
}
</style>
