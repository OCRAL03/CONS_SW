document.addEventListener("turbo:load", () => {
    const navbarToggle = document.querySelector(".navbar-toggler");
    const navbarCollapse = document.querySelector(".navbar-collapse");
  
    if (navbarToggle && navbarCollapse) {
      navbarToggle.addEventListener("click", () => {
        navbarCollapse.classList.toggle("show");
      });
    }
  });
  