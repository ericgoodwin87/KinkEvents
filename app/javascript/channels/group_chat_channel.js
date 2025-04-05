import consumer from "./consumer";

let subscription = null;

document.addEventListener("turbo:load", () => {
  const form = document.querySelector("#new_message");
  if (form) {
    const groupId = form.dataset.groupId;
    if (subscription) {
      subscription.unsubscribe();
    }
    subscription = consumer.subscriptions.create({ channel: "GroupChatChannel", group_id: groupId }, {
      connected() { console.log("Connected to", groupId); },
      disconnected() { console.log("Disconnected"); },
      received(data) {
        console.log("Received:", data);
        document.getElementById("messages").insertAdjacentHTML("beforeend", `<p>${data.content} - ${data.user}</p>`);
      }
    });
  }
});