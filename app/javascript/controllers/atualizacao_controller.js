import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
   static values = {
    intervalo: {
      type: Number,
      default: 30000
    }
  }

  connect() {
    this.iniciarAtualizacaoAutomatica()
  }

  disconnect() {
    this.pararAtualizacaoAutomatica()
  }

  atualizar() {
    window.location.reload()
  }

  iniciarAtualizacaoAutomatica() {
    this.temporizador = setInterval(() => {
      this.atualizar()
    }, this.intervaloValue)
  }

  pararAtualizacaoAutomatica() {
    clearInterval(this.temporizador)
  }
}