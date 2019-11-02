const ManifestPlugin = require('webpack-manifest-plugin');

const entry = {}

module.exports = {
  // コンパイル後のファイルの設置先。
  outputDir: '../public/dist/',
  configureWebpack: {
    plugins: [
      // cookie管理のために必要
      new ManifestPlugin({
        fileName: 'manifest.json',
        publicPath: '/dist/',
        writeToFileEmit: true
      })
    ],
    entry
  },
  // imageだけは、パス指定が必要。JSとCSSは、Rails側でパスを指定できるので必要ない。
  chainWebpack: config => {
    config.module
      .rule('images').use('url-loader')
      .tap(options =>
        Object.assign({}, options, {
          publicPath: './dist/'
        })
      )
  }
}