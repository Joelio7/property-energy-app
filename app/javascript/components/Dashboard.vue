<template>
  <div>
    <ul id="property-listings">
      <li v-bind:key="property.id" v-for="property in this.properties">
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
              {{property.energy_recordings.map(record => record.units).reduce((partial_sum, a) => partial_sum + a,0)}}
            </b-card-text>
          </b-card>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      properties: {},
    }
  },
  computed: {
  },
  created () {
    this.properties = JSON.parse(document.querySelector('#properties').getAttribute('data'))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>