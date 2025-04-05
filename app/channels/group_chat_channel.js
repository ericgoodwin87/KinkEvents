import consumer from "./consumer";

consumer.subscriptions.create("GroupChatChannel", {
  connected() {
    console.log("Connected to GroupChatChannel");
  },

  disconnected() {
    console.log("Disconnected from GroupChatChannel");
  },

  received(data) {
    console.log("Received data:", data);
    const messages = document.getElementById("messages");
    messages.insertAdjacentHTML("beforeend", `<p>${data.content} - ${data.user}</p>`);
  }
});