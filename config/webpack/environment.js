const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Rails: ['@rails/ujs'],
    Popper: ['popper.js', 'default'],
    lozad: 'lozad',
    AOS: 'aos'
  })
)

const aliasConfig = {
	'jquery': 'jquery/src/jquery',
  'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};

environment.config.set('resolve.alias', aliasConfig);

module.exports = environment
