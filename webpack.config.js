const path = require("path")

const config = {
  module: {
    rules: [
      {
        test: /\.js$/,
        use: [{
          loader: "babel-loader",
          options: {
            ignore: "/node_modules/",
            presets: ["es2015"]
          },
        }],
      },
    ],
  },
  resolve: {
    alias: { "vue$": "vue/dist/vue.esm.js" }
  },
  watch: true
}

module.exports = config
