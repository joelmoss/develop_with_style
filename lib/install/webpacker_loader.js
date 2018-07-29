// This modifies the CSS modules loader to use a different ident that allows us to pick it out via
// the #style Rails helper.

const { environment } = require('@rails/webpacker')
const path = require('path')

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

['moduleCss', 'moduleSass'].forEach(mod => {
  try {
    const loader = environment.loaders.get(mod);
    const index = loader.use.findIndex(el => el.loader === 'css-loader');
    loader.use[index].options = { modules: true, sourceMap: true, getLocalIdent }
  } catch(error) {
    console.error(error)
  }
})
