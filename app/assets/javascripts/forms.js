document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".add_fields").forEach(button => {
      button.addEventListener("click", event => {
        event.preventDefault();
        const association = button.dataset.association;
        const content = button.dataset.fields.replace(/new_\w+/g, new Date().getTime());
        button.insertAdjacentHTML("beforebegin", content);
      });
    });
  
    document.querySelectorAll(".remove_fields").forEach(button => {
      button.addEventListener("click", event => {
        event.preventDefault();
        const field = button.closest(".form-group");
        field.querySelector("input[type='hidden']").value = "1";
        field.style.display = "none";
      });
    });
  });
  