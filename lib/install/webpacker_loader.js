// This modifies the CSS modules loader to use a different ident that allows us to pick it out via
// the #style Rails helper.

const { environment } = require('@rails/webpacker')
const path = require('path')

let sassLoader = environment.loaders.get('moduleSass');
const index = sassLoader.use.findIndex(el => el.loader === 'css-loader');

function getLocalIdent(loaderContext, localIdentName, localName, options) {
  if(!options.context) {
    if (loaderContext.rootContext) {
      options.context = loaderContext.rootContext;
    } else if (loaderContext.options && typeof loaderContext.options.context === "string") {
      options.context = loaderContext.options.context;
    } else {
      options.context = loaderContext.context;
    }
  }

  var request = path.relative(options.context, loaderContext.resourcePath)
  request = Buffer.from(request).toString('base64').replace(/\W/, '')

  return request.substr(0, 8) + '__' + localName
}

sassLoader.use[index].options = {
  modules: true,
  sourceMap: true,
  getLocalIdent
}
