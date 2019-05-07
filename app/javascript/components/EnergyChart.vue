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
                'rgba(255, 159, 64, 0.2)',
                'rgba(210, 115, 64, 0.2)',
                'rgba(40, 130, 60, 0.2)',
                'rgba(89, 120, 175, 0.2)',
                'rgba(145, 60, 130, 0.2)',
                'rgba(200, 200, 150, 0.2)',
                'rgba(100, 222, 180, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(210, 115, 64, 1)',
                'rgba(40, 130, 60, 1)',
                'rgba(89, 120, 175, 1)',
                'rgba(145, 60, 130, 1)',
                'rgba(200, 200, 150, 1)',
                'rgba(100, 222, 180, 1)',
            ],
            borderWidth: 1
        }]
     },
     options: {
       responsive: true,
       maintainAspectRatio: false,
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