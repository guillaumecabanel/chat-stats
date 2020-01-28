import { Chart } from "frappe-charts/dist/frappe-charts.min.esm";

document.addEventListener('DOMContentLoaded', (event) => {
  const charts = document.querySelectorAll('.chart')

  charts.forEach((chart) => {
    console.log('Generating ', chart.dataset.title)
    console.log('labels: ', JSON.parse(chart.dataset.labels))
    console.log('values: ', JSON.parse(chart.dataset.values))

    const data = {}
  
    if (chart.dataset.chartType == 'heatmap') {
      const heatMapOptions = {
        dataPoints: JSON.parse(chart.dataset.points),
        start: Date.parse(chart.dataset.start),
        end: Date.parse(chart.dataset.end)
      }
  
      Object.assign(data, heatMapOptions)
    } else {
      const defaultOptions = {
        labels: JSON.parse(chart.dataset.labels),
        datasets: [
          {
            name: chart.dataset.datasetsTitle,
            type: chart.dataset.chartType,
            values: JSON.parse(chart.dataset.values)
          }
        ],
      }
  
      Object.assign(data, defaultOptions)
    }
  
    new Chart(
      chart,
      {
        title: chart.dataset.title,
        data: data,
        type: chart.dataset.chartType,
        colors: JSON.parse(chart.dataset.chartColors),
        discreteDomains: 0
      }
    )
  })
})
