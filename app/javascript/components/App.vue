<template>
  <div id="app">
    <Dashboard></Dashboard>
    <p>{{ message }}</p>
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
p {
  font-size: 2em;
  text-align: center;
}
</style>
