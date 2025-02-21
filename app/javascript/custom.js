// navbar fixed js
document.addEventListener("DOMContentLoaded", function () {
    var navbar = document.getElementById("navbar");
    function stickyNavbar() {
        if (window.scrollY > 130) {
            navbar.classList.add("sticky");
        } else {
            navbar.classList.remove("sticky");
        }
    }
    window.addEventListener("scroll", stickyNavbar);
});

// text animation js
const textElement = document.getElementById("animatedText");
const texts = ["Connect, Vibe and Discover", "Remote Road Trips"];
let textIndex = 0;
let charIndex = 0;
let isDeleting = false;

function type() {
    const currentText = texts[textIndex];
    textElement.innerHTML = currentText.slice(0, charIndex);

    if (!isDeleting && charIndex < currentText.length) {
        charIndex++;
        setTimeout(type, 150);
    } else if (isDeleting && charIndex > 0) {
        charIndex--;
        setTimeout(type, 100);
    } else {
        isDeleting = !isDeleting;
        if (!isDeleting) {
            textIndex = (textIndex + 1) % texts.length;
        }
        setTimeout(type, 700); // Pause before starting to delete or move to next text
    }
}

type(); // Start the typing animation


// Select the up arrow
const scrollToTopButton = document.getElementById('scrollToTop');

// Show the button when scrolled near the bottom
window.addEventListener('scroll', () => {
  const scrollableHeight = document.documentElement.scrollHeight - window.innerHeight;
  const scrolledFromTop = window.scrollY;

  // Check if scrolled past the middle
  if (scrolledFromTop >= scrollableHeight / 2) {
    scrollToTopButton.classList.add('show');
  } else {
    scrollToTopButton.classList.remove('show');
  }
});

// Scroll to the top on click
scrollToTopButton.addEventListener('click', () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
});


const navbarToggler = document.querySelector('.navbar-toggler');
const navbarbackdrop = document.querySelector('.navbar-backdrop');


navbarToggler.addEventListener('click', () => {
  navbarToggler.classList.toggle('open');
  navbarbackdrop.classList.toggle('open')
});