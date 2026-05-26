import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

export default class extends Controller {
  static values = {
    url: String,
    playerId: Number
  }

  async roll() {
    this.animateDices()

    await this.wait(800)

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

  animateDices() {
    const container =
      document.querySelector(
        `#player-dices-${this.playerIdValue}`
      )

    if (!container) return

    container
      .querySelectorAll("[data-controller='dice']")
      .forEach((dice) => {
        dice.classList.remove("rolling")

        void dice.offsetWidth

        dice.classList.add("rolling")
      })
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
