import Typed from "typed.js";

const loadDynamicBannerText = () => {
  new Typed("#banner-typed-text", {
    strings: ["Saver", "Login!"],
    typeSpeed: 220,
    loop: true,
  });
};

export { loadDynamicBannerText };
