// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

(function($) {
  var $nav   = $('#navArea');
  var $btn   = $('.toggle_btn');
  var $mask  = $('#mask');
  var open   = 'open'; // class
  // menu open close
  $btn.on( 'click', function() {
    if ( ! $nav.hasClass( open ) ) {
      $nav.addClass( open );
    } else {
      $nav.removeClass( open );
    }
  });
  // mask close
  $mask.on('click', function() {
    $nav.removeClass( open );
  });
} )(jQuery);

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

document.addEventListener('turbo:load', () => {
  if (document.querySelector('#editor') && !document.querySelector('.ql-container')) {

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
  };
});

document.addEventListener("DOMContentLoaded", () => {
  const targets = document.querySelectorAll(".fade-up, .slide-in-left");

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("active");
        // 一度だけ発火させたい場合は以下を追加
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 }); // 20%見えたら発火

  targets.forEach(target => observer.observe(target));
});
