import { Application } from "@hotwired/stimulus"
import "article"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
