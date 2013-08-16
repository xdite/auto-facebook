case ::Rails.version.to_s
when /^4/
  require 'auto/facebook/engine'
when /^3\.[12]/
  require 'auto/facebook/engine3'
when /^3\.[0]/
  require 'auto/facebook/railtie'
end