# Introducing the RSS to Dynarex gem

## Example

    require 'rss_to_dynarex'

    rtd = RSStoDynarex.new 'http://stallman.org/rss/rss.xml'
    dynarex = rtd.to_dynarex
    dynarex.save 'rms.xml'

rss dynarex xml gem
