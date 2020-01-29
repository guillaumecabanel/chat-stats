import { Controller } from "stimulus"
import { Chart } from "frappe-charts/dist/frappe-charts.min.esm";

export default class extends Controller {
  static targets = [ "chart" ]

  connect() {
    const title         = this.data.get('title')
    const datasetsTitle = this.data.get('datasets-title')
    const type          = this.data.get('type')
    const labels        = JSON.parse(this.data.get('labels'))
    const values        = JSON.parse(this.data.get('values'))
    const colors        = JSON.parse(this.data.get('colors'))

    const data = {
      labels: labels,
      datasets: [
        {
          name: datasetsTitle,
          type: type,
          values: values
        }
      ],
    }
  
    new Chart(
      this.chartTarget,
      {
        title: title,
        data: data,
        type: type,
        colors: colors,
        discreteDomains: 0
      }
    )
  }
}
