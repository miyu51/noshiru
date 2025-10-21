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

  const previewButton = document.getElementById('preview-button');
  const previewArea = document.getElementById('preview-area');
  const previewContent = document.getElementById('preview-content');
  const hiddenInput = document.querySelector('input[name="column[text]"]');

  quill.on('text-change', () => {
    hiddenInput.value = quill.root.innerHTML;
  });

  previewButton.addEventListener('click', () => {
    previewContent.innerHTML = quill.root.innerHTML;
    previewArea.classList.remove('hidden');
  });
});
