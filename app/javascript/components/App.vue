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
@media (max-width: 576px) {
  h5 {
    margin-right: 35px;
    margin-bottom: 50px;
    font-size: 15px;
  }
  h1 {
    margin-right: 20px;
    text-align: center;
  }
}
@media (max-width: 375px) {
  h5 {
    margin-left: 50px;
    margin-bottom: 50px;
    font-size: 15px;
  }
  h1 {
    text-align: center;
  }
}
</style>
