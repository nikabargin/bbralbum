require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://example.com'
SitemapGenerator::Sitemap.create do
  add '/catalog', :changefreq => 'daily', :priority => 0.9
end
SitemapGenerator::Sitemap.ping_search_engines