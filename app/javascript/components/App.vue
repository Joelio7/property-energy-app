<template>
  <div id="app">
    <h1>Watt-Age</h1>
    <h5> Find out how much energy your property has used over time </h5>
    <Dashboard></Dashboard>
  </div>
</template>

<script>
import Dashboard from '../components/Dashboard.vue'
export default {
  components: {
    'Dashboard': Dashboard
  }
}
</script>

<style scoped>

h5 {
  text-align: center;
  margin-bottom: 50px;
}
h1 {
  text-align: center;
}
@media only screen and (min-device-width: 360px) and (max-device-height: 640px) {
    h5 {
  margin-left: 50px;
  margin-bottom: 50px;
}
h1 {
  margin-left: 50px;
  text-align: center;
}
   }
</style>
