const webpack = require('webpack');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

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
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"production"'
      }
    }),
    new webpack.optimize.UglifyJsPlugin()
  ],
  resolve: {
    alias: { "vue$": "vue/dist/vue.esm.js" }
  }
}

module.exports = config
