#!/usr/bin/env ruby

# file: rss_to_dynarex.rb

require 'dynarex'
require 'nokogiri'

class RSStoDynarex

  attr_reader :to_dynarex

  def initialize(url)

    lib = File.dirname(__FILE__)
    xsl_buffer = File.read(lib + '/rss_to_dynarex.xsl')

    xslt  = Nokogiri::XSLT(xsl_buffer)
    doc = open(url, 'UserAgent' => 'RSStoDynarex')
    @to_dynarex = xslt.transform(Nokogiri::XML(doc.to_s))
  end

end

if __FILE__ == $0 then

  rtd = RSStoDynarex.new 'http://stallman.org/rss.xml'
  dynarex = rtd.to_dynarex
  dynarex.save 'rms.xml'
end
