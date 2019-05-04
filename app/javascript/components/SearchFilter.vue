<template>
  <div>
    <b-form>
      <b-form-group
        id="input-group-1"
        label="property area"
        label-for="input-1"
        description="search by neighborhood"
      >
        <b-form-input
          @keyup="filterResults()"
          id="input-1"
          v-model="conditions.property_area"
          required
          placeholder="Search By Neighborhood"
        ></b-form-input>
      </b-form-group>
    </b-form>
  </div>
</template>

<script>
export default {
  
  data: function () {
    return {
      conditions: {
        property_area: ''
      }
    }
  },
  methods: {
    filterResults () {
      let conditions = {}
      if (this.conditions.property_area) {
        conditions.property_area = this.conditions.property_area
      }
      console.log(conditions)
      let objectsToSearch = this.properties
      function getObjects (filters) {
        return objectsToSearch.filter(function (o) {
          return Object.keys(filters).every(function (k) {
            return JSON.stringify(o[k]).split(',').some(function (v) {
              return v.toUpperCase().includes(filters[k].toUpperCase())
            })
          })
        })
      }
      this.results = getObjects(conditions)
      console.log(this.results)
      this.$emit('updateResults', this.results)
    }
  },
  props: ['properties']
}
</script>

<style scoped>
</style>