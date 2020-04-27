import { Controller } from "stimulus"
import Tagify from '@yaireo/tagify'

export default class extends Controller {
  static targets = [ "tagify" ]

  connect() {
    const whitelist = this.element.getAttribute('data-whitelist').split(',')
    this.tagify = new Tagify(this.tagifyTarget, {
      whitelist: whitelist,
      maxTags: 5,
      dropdown: {
        classname: "color-blue",
        enabled: 0,
        maxItems: 30,
        closeOnSelect: false,
        highlightFirst: true,
      },
    })
  }

  disconnect() {
    this.tagify.removeAllTags()
    const classes = this.element.getElementsByClassName('tagify')
    Array.from(classes).forEach(e => e.remove())
  }
}
