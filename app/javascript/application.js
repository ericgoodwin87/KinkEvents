import { Turbo } from "@hotwired/turbo-rails";
import "./channels/consumer";
import "./channels/group_chat_channel";

document.addEventListener("turbo:submit-end", (event) => {
  if (event.detail.success) {
    const form = event.target;
    if (form.id === "new_message") {
      form.querySelector("textarea").value = "";
    }
  }
});