// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

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
