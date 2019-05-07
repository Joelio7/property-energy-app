<template>
  <div>
    <h4>Filter Properties By:</h4>
    <b-form inline>
      <b-form-input
        @keyup="filterResults()"
        id="input-1"
        class="form-control"
        v-model="conditions.property_area"
        required
        placeholder="Search By Neighborhood"
      >
      </b-form-input>
      <b-form-select  @change="filterResults()" placeholder="energy type" v-model="conditions.energy_type" :options="[ { value: null, text: 'Energy Source' }, { value: 'solar', text: 'Solar' }, { value: 'gas', text: 'Gas' }, { value: 'electric', text: 'Electric' },]" class="form-control"></b-form-select>
      <b-form-select @change="filterResults()" placeholder="housing type" v-model="conditions.property_type" :options="[ { value: null, text: 'Property Type' }, { value: 'house', text: 'House' }, { value: 'apartment', text: 'Apartment' }, { value: 'condo', text: 'Condo' },]" class="form-control"></b-form-select>
    </b-form>
  </div>
</template>

<script>
export default {
  
  data: function () {
    return {
      conditions: {
        property_area: '',
        property_type: null,
        energy_type: null
      }
    }
  },
  methods: {
    filterResults () {
      let conditions = {}
      if (this.conditions.property_area) {
        conditions.property_area = this.conditions.property_area
      }
      if (this.conditions.property_type) {
        conditions.property_type = this.conditions.property_type
      }
      if (this.conditions.energy_type) {
        conditions.energy_type = this.conditions.energy_type
      }
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
      this.$emit('updateResults', this.results)
    }
  },
  props: ['properties']
}
</script>

<style scoped>
#input-1 {
  width: 225px;
}
.form-inline {
  padding: 20px;
  display: -webkit-inline-box;
  margin-right: 50px;
}
h4 {
  margin-right: 20px;
}
@media (max-width: 576px) {
  .form-inline {
    display: inline-grid;
  }
  h4 {
    text-align: center;
  }
  .form-control {
    margin-left: 0;
    margin-right: 0;
    width: 225px;
  }
  select {
    margin-top: 10px;
  }
}

@media (max-width: 375px) {
  .form-inline {
    display: inline-grid;
  }
  h4 {
    margin-left: 10px;
    text-align: center;
  }
  .form-control {
    margin-left: 50px;
    width: 225px;
  }
  select {
    margin-top: 10px;
  }
}
</style>