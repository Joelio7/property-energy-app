<template>
  <div>
    <SearchFilter @updateResults="addSearchFilters" :properties="properties" ></SearchFilter>
    <div class="energy-filtering">
      <p> start date </p>
      <input v-model="energyReadingStartTime" type="date">
      <p> end date </p>
      <input v-model="energyReadingEndTime" type="date">
    </div>
    <ul id="property-listings">
      <li v-bind:key="property.id" v-for="property in this.filteredProperties.length > 0 ? this.filteredProperties : this.properties">
        <div>
          <b-card
            :title="property.property_type"
            img-src="https://picsum.photos/600/300/?image=25"
            img-alt="Image"
            img-top
            tag="article"
            style="max-width: 20rem;"
            class="mb-2"
          >
            <b-card-text>
              {{property.energy_type}}
              {{property.energy_recordings.filter(e => filterEnergyReadingsByTime(e.time_recorded)).map(record => record.units).reduce((partial_sum, a) => partial_sum + a,0)}}
            </b-card-text>
          </b-card>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import SearchFilter from '../components/SearchFilter.vue'
export default {
  data: function () {
    return {
      properties: [],
      filteredProperties: [],
      energyReadingStartTime: null,
      energyReadingEndTime: null
    }
  },
  components: {
    'SearchFilter': SearchFilter
  },
  created () {
    this.properties = JSON.parse(document.querySelector('#properties').getAttribute('data'))
  },
  methods: {
    filterEnergyReadingsByTime (time) {
      if (this.energyReadingStartTime && this.energyReadingEndTime) {
        const formattedFilterTimeStamp = new Date(time.split('T')[0])
        const startDate = new Date(this.energyReadingStartTime)
        const endDate = new Date(this.energyReadingEndTime)
        console.log(startDate)
        console.log(formattedFilterTimeStamp)
        console.log(endDate)
        if(startDate <= formattedFilterTimeStamp && formattedFilterTimeStamp <= endDate) {
          console.log(true)
          return true
        } else {
          console.log(false)
          return false
        }
      } else {
        console.log(true)
        return true
      }
    },
    addSearchFilters (value) {
      if (value) {
        this.filteredProperties = value
      } else {
        this.filteredProperties = this.properties 
      }
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>