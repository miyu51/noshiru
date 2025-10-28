// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function () {
  const menuBar = document.getElementById("menu-bar");
  const menu = document.getElementById("menu");
  if (menuBar && menu && !menuBar.dataset.listenerAttached) {
  menuBar.addEventListener("click", () => {
    menu.classList.toggle("hidden");
  });
  menuBar.dataset.listenerAttached = "true";
  }
});

document.addEventListener("turbo:load", function () {
  const slide = document.querySelector(".slide-items");
  if (slide && !$(slide).hasClass("slick-initialized")) {
    $(slide).slick({
      autoplay: true, // 自動再生
      centerMode: true,// 前後スライドを部分表示
      centerPadding: '20%',// 両端の見切れるスライド幅
      infinite: true,
      arrows: true,
    });
  }
});

document.addEventListener('DOMContentLoaded', () => {

});

document.addEventListener('turbo:load', () => {
  if (document.querySelector('.ql-toolbar')) {
    return;
  }

  const quill = new Quill('#editor', {
    theme: 'snow',
    placeholder: 'ここにコラムを書く。',
    modules: {
      toolbar: '#toolbar-container'
    }
  });

  const hiddenInput = document.querySelector('input[name="column[text]"]');

  quill.on('text-change', () => {
    hiddenInput.value = quill.root.innerHTML;
  });

  const form = document.querySelector("form");

  form.addEventListener("submit", () => {
    hiddenInput.value = quill.root.innerHTML;
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const columns = document.querySelectorAll(".column-slideshow");

  columns.forEach((column) => {
    const images = column.querySelectorAll(".slideshow-image");
    let index = 0;
    let timer = null;

    column.addEventListener("mouseenter", () => {
      if (images.length <= 1) return;

      timer = setInterval(() => {
        images.forEach((img, i) => {
          img.style.opacity = i === index ? "1" : "0";
        });
        index = (index + 1) % images.length;
      }, 1500);
    });

    column.addEventListener("mouseleave", () => {
      clearInterval(timer);
      images.forEach((img, i) => {
        img.style.opacity = i === 0 ? "1" : "0";
      });
      index = 0;
    });
  });
});
