import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    // Start polling at 1 second interval
    this.timer = setInterval(() => {
      this.refresh();
    }, 1000);
  }

  refresh() {
    fetch(this.data.get("url"))
      .then(response => response.json())
      .then(data => {
        if (data.stats_present) {
          this.stopRefresh();
          window.location.reload(false); 
        }
      })
  }

  stopRefresh() {
    if (this.timer) {
      clearInterval(this.timer);
    }
  }

  disconnect() {
    this.stopRefresh();
  }
}
