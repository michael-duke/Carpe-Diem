const withMT = require("@material-tailwind/html/utils/withMT");

module.exports = withMT({
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Proxima Nova', 'sans-serif'],
      },
      colors: {
        main: '#3778C2',
        second: '#5fb523',
        text: '#434B54',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
})
