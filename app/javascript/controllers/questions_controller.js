import consumer from "channels/consumer";

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["banner"];

  connect() {
    consumer.subscriptions.create("QuestionsChannel", {
      received: (data) => {
        this.bannerTarget.hidden = false;
      },
    });
  }
}
