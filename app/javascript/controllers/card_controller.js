import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

export default class extends Controller {

  static values = {
    url: String
  }

  async activateCard() {

    this.activate()

    await this.wait(500)

    const response = await fetch(this.urlValue, {
      method: "POST",
      headers: {
        "Accept": "text/vnd.turbo-stream.html",
        "X-CSRF-Token": this.csrfToken()
      }
    })

    const html = await response.text()

    Turbo.renderStreamMessage(html)
  }

  activate() {
    this.element.classList.remove("card-activating")

    void this.element.offsetWidth

    this.element.classList.add("card-activating")
  }

  wait(ms) {
    return new Promise(resolve => {
      setTimeout(resolve, ms)
    })
  }

  csrfToken() {
    return document
      .querySelector("meta[name='csrf-token']")
      .content
  }

}
