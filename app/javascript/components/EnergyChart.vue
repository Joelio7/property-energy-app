<script>
import { Bar } from 'vue-chartjs'

export default {
  extends: Bar,
  props: ['monthlyEnergyReadings'],
  watch: {
    monthlyEnergyReadings: {
      handler(n, o) {
        this.chartdata.datasets[0].data = []
        this.chartdata.datasets[0].data.push(n.january)
        this.chartdata.datasets[0].data.push(n.february)
        this.chartdata.datasets[0].data.push(n.march)
        this.chartdata.datasets[0].data.push(n.april)
        this.chartdata.datasets[0].data.push(n.may)
        this.chartdata.datasets[0].data.push(n.june)
        this.chartdata.datasets[0].data.push(n.july)
        this.chartdata.datasets[0].data.push(n.august)
        this.chartdata.datasets[0].data.push(n.september)
        this.chartdata.datasets[0].data.push(n.october)
        this.chartdata.datasets[0].data.push(n.november)
        this.chartdata.datasets[0].data.push(n.december)
        this.renderChart(this.chartdata, this.options)
      },
      deep: true
    }
  },
  data: function () {
    return {
     chartdata: {
       labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [{
            label: 'Total Energy Used per month',
            data: [],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
     },
     options: {
        scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }]
        }
     }
    }
  },
  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}
</script>

<style>
</style>