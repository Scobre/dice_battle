import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.boundRoll = this.roll.bind(this)

    window.addEventListener(
      "roll-dices",
      this.boundRoll
    )
  }

  disconnect() {
    window.removeEventListener(
      "roll-dices",
      this.boundRoll
    )
  }

  roll() {
    this.element.classList.add("rolling")

    setTimeout(() => {
      this.element.classList.remove("rolling")
    }, 1000)
  }
}
