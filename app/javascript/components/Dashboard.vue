<template>
  <div>   
    <b-row>
      <b-col class="search-filter-space" cols="12">
        <SearchFilter @updateResults="addSearchFilters" :properties="properties" ></SearchFilter>
      </b-col>
    </b-row> 
    <ul id="property-listings">
      <b-container>
      <b-row>
        <li v-bind:key="property.id" v-for="property in this.filteredProperties">
         <b-col sm="12">
        <div class="card-holder">
          <b-card
            title="Property Details"
            :img-src="property.photo_url"
            img-alt="Image"
            img-top
            tag="article"
            style="max-width: 20rem;"
            class="mb-2"
          >
          <hr>
            <b-card-text>
              <p> <b> Property Type: </b> {{property.property_type}} </p>
              <p> <b> Energy Class: </b> {{property.energy_type}} </p>
              <p> <b> Energy Used: </b> {{property.energy_recordings.filter(e => filterEnergyReadingsByTime(e.time_recorded)).map(record => record.units).reduce((partial_sum, a) => partial_sum + a,0)}} kWh </p>
              <p> <b> Neighborhood: </b> {{property.property_area}} </p>
            </b-card-text>
          </b-card>
        </div>
          </b-col>
        
      </li>
 </b-row>
    </b-container>
    </ul>
    <div class="energy-filtering">
      <p>Set a start and end date to calculate total energy usage for a given time period: </p>
      <input @change="setTimesRecorded" v-model="energyReadingStartTime" type="date">
      <input @change="setTimesRecorded" v-model="energyReadingEndTime" type="date">
      <EnergyChart :monthlyEnergyReadings="totalEnergyReadingsByMonth"></EnergyChart>
    </div>
  </div>
</template>

<script>
import SearchFilter from '../components/SearchFilter.vue'
import EnergyChart from '../components/EnergyChart.vue'
export default {
  data: function () {
    return {
      properties: [],
      filteredProperties: [],
      timesRecorded: [],
      totalEnergyReadingsByMonth: {january: 0, february: 0, march: 0, april: 0, may: 0, june: 0, july: 0, august: 0, september: 0, october: 0, november: 0, december: 0 },
      energyReadingStartTime: null,
      energyReadingEndTime: null
    }
  },
  components: {
    'SearchFilter': SearchFilter,
    'EnergyChart': EnergyChart
  },
  created () {
    this.properties = JSON.parse(document.querySelector('#properties').getAttribute('data'))
  },
  mounted () {
    this.filteredProperties = this.properties
    this.setTimesRecorded()
  },
  methods: {
    filterEnergyReadingsByTime (time) {
      if (this.energyReadingStartTime && this.energyReadingEndTime) {
        const formattedFilterTimeStamp = new Date(time.split('T')[0])
        const startDate = new Date(this.energyReadingStartTime)
        const endDate = new Date(this.energyReadingEndTime)
        if(startDate <= formattedFilterTimeStamp && formattedFilterTimeStamp <= endDate) {
          return true
        } else {
          return false
        }
      } else {
        return true
      }
    },
    setTimesRecorded () {
      this.timesRecorded = []
      for (var property of this.filteredProperties) {
        this.timesRecorded.push(property.energy_recordings.filter(e => this.filterEnergyReadingsByTime(e.time_recorded)))
      }
      this.setTotalEnergyPerMonth()
    },
    setTotalEnergyPerMonth () {
      Object.keys(this.totalEnergyReadingsByMonth).forEach(v => this.totalEnergyReadingsByMonth[v] = 0)
      let timeStamps = this.timesRecorded.flat()
      for (let timeStamp of timeStamps) {
        let date = new Date(timeStamp.time_recorded)
        if (this.monthName(date) === 'january') {
          this.totalEnergyReadingsByMonth.january = (this.totalEnergyReadingsByMonth.january + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'february') {
          this.totalEnergyReadingsByMonth.february = (this.totalEnergyReadingsByMonth.february + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'march') {
          this.totalEnergyReadingsByMonth.march = (this.totalEnergyReadingsByMonth.march + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'april') {
          this.totalEnergyReadingsByMonth.april = (this.totalEnergyReadingsByMonth.april + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'may') {
          this.totalEnergyReadingsByMonth.may = (this.totalEnergyReadingsByMonth.may + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'june') {
          this.totalEnergyReadingsByMonth.june = (this.totalEnergyReadingsByMonth.june + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'july') {
          this.totalEnergyReadingsByMonth.july = (this.totalEnergyReadingsByMonth.july + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'august') {
          this.totalEnergyReadingsByMonth.august = (this.totalEnergyReadingsByMonth.august + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'september') {
          this.totalEnergyReadingsByMonth.september = (this.totalEnergyReadingsByMonth.september + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'october') {
          this.totalEnergyReadingsByMonth.october = (this.totalEnergyReadingsByMonth.october + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'november') {
          this.totalEnergyReadingsByMonth.november = (this.totalEnergyReadingsByMonth.november + timeStamp.units) || 0
        }
        if (this.monthName(date) === 'december') {
          this.totalEnergyReadingsByMonth.december = (this.totalEnergyReadingsByMonth.december + timeStamp.units) || 0
        }
      }
    },
    monthName (dateGiven){
      let mlist = [ "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ];
      return mlist[dateGiven.getMonth()];
    },
    addSearchFilters (value) {
      if (value.length > 0) {
        this.filteredProperties = value
      } else {
        this.filteredProperties = []
      }
      this.setTimesRecorded()
    }
  }
}
</script>

<style scoped>
li {
  list-style-type: none;
}
.b-card-text {
  text-align: left;
}
.card-title {
  text-align: center;
}
.card-img-top {
  height: 133px;
}
.card {
  width: 250px;
  height: 396px;
}

   @media only screen and (min-device-width: 360px) and (max-device-height: 823px) {
       .card-holder {
    width: 350px;
    height: 420px;
  }
  .card {
   width: 300px;
   height: 420px;
   border: 1px solid black;
   margin-top: 10px;
   text-align: center;
  }
   
  .card {
   width: 300px;
   height: 420px;
   border: 1px solid black;
   margin-top: 10px;
   text-align: center;
  }
   }
   @media only screen and (min-device-width: 768px) and (max-device-height: 1024px) {
     ul {
       margin-left: 62px;
     }
   }

   
  
   

 
  
 
.search-filter-space {
  text-align: center;
}

.energy-filtering {
  text-align: center;
}

</style>