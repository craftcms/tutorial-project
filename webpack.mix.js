// load mix
let mix = require("laravel-mix");

// compile src/styles.css → web/styles.css
mix.postCss("src/styles.css", "web/", [
  require("postcss-nested"),
  require("tailwindcss")
]);
