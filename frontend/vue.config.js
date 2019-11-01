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
}