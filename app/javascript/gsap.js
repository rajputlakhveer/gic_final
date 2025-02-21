document.addEventListener("DOMContentLoaded", function () {
  const text = document.querySelector(".stagger-text");
  const tl = gsap.timeline();

  // Staggered text animation for each character
  tl.from(".navbar-nav li", {
    y: -50,                // Slide down from -50px
    opacity: 0,            // Start with 0 opacity
    duration: 1,           // Each letter animates for 1 second
    ease: "power2.out",    // Easing for the sliding effect
    stagger: 0.10,      // Stagger animation (0.05 seconds between each letter)
  });

  // Optional - animate the overlay background
  tl.from(".overlay-bg", {
    opacity: 0,      // Fade in the overlay
    duration: 1.5,
    ease: "power2.out"
  }, "-=1.5");
});

// // Initialize Lenis
// const lenis = new Lenis();

// Use requestAnimationFrame to continuously update the scroll
// function raf(time) {
//   lenis.raf(time);
//   requestAnimationFrame(raf);
// }

// requestAnimationFrame(raf);


// Select slider elements
const swiperEl = document.querySelector('.upcoming-slider');
const swiperElfes = document.querySelector('.festival-slider');
const tripSwiper = document.querySelector('.trip-slider');
const tripSwiper1 = document.querySelector('.trip-slider1');
const tripSwiper2 = document.querySelector('.trip-slider2');
const tripSwiper3 = document.querySelector('.trip-slider3');
const festivalslider1 = document.querySelector('#festival');

// Define common Swiper params
const commonParams = {
  injectStyles: [`
      .swiper-pagination-bullet-active {
        color: #fff;
        background: #0A9E88;
      }
      .swiper-pagination {
        position: relative;
        bottom: -5px !important;
      }
      .swiper-button-prev {
        position: relative;
        bottom: -39px;
        left: 90%;
        background-color: #36C0B2;
        width: 45px;
        height: 45px;
        border-radius: 50%;
        color: #fff;
        font-weight: 900;
        box-shadow: 0px 3px 6px #676767d6;
      }
      .swiper-button-prev:hover {
        background-color: #25978c;
      }
      .swiper-button-prev svg {
        width: 22px;
        height: 22px;
      }
      .swiper-button-next {
        position: relative;
        bottom: -16px;
        left: 95%;
        background-color: #36C0B2;
        width: 45px;
        height: 45px;
        border-radius: 50%;
        color: #fff;
        font-weight: 900;
        box-shadow: 0px 3px 6px #676767d6;
      }
      .swiper-button-next:hover {
        background-color: #25978c;
      }
      .swiper-button-next svg {
        width: 22px;
        height: 22px;
      }
      @media only screen and (min-width: 320px) and (max-width: 520px) {
        .swiper-button-prev, .swiper-button-next {
          display: none;
        }
      }
  `],
};

const tripParams = {
  injectStyles: [`
    .swiper-pagination-bullet-active {
      color: #fff;
      background: #0A9E88;
    }
    .swiper-pagination {
      position: relative;
      bottom: -5px !important;
    }
    .swiper-button-prev {
      position: relative;
      bottom: -39px;
      left: 90%;
      background-color: #36C0B2;
      width: 45px;
      height: 45px;
      border-radius: 50%;
      color: #fff;
      font-weight: 900;
      box-shadow: 0px 3px 6px #676767d6;
    }
    .swiper-button-prev:hover {
      background-color: #25978c;
    }
    .swiper-button-prev svg {
      width: 22px;
      height: 22px;
    }
    .swiper-button-next {
      position: relative;
      bottom: -16px;
      left: 95%;
      background-color: #36C0B2;
      width: 45px;
      height: 45px;
      border-radius: 50%;
      color: #fff;
      font-weight: 900;
      box-shadow: 0px 3px 6px #676767d6;
    }
    .swiper-button-next:hover {
      background-color: #25978c;
    }
    .swiper-button-next svg {
      width: 22px;
      height: 22px;
    }
    @media only screen and (min-width: 320px) and (max-width: 520px) {
      .swiper-button-prev, .swiper-button-next {
        display: none;
      }
    }
`],
};

// Apply params and initialize Swipers
Object.assign(swiperEl, commonParams);
Object.assign(swiperElfes, commonParams);
Object.assign(tripSwiper, tripParams);
Object.assign(tripSwiper1, tripParams);
Object.assign(tripSwiper2, tripParams);
Object.assign(tripSwiper3, tripParams);
Object.assign(festivalslider1, commonParams);