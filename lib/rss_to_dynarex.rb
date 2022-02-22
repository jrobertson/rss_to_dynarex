#!/usr/bin/env ruby

# file: rss_to_dynarex.rb

require 'dynarex'
require 'nokogiri'

class RSStoDynarex
  include RXFReader

  attr_reader :to_dynarex

  def initialize(url)

    lib = File.dirname(__FILE__)
    xsl_buffer = File.read(lib + '/rss_to_dynarex.xsl')
    #xsl_buffer = File.read('rss_to_dynarex.xsl')

    xslt  = Nokogiri::XSLT(xsl_buffer)
    #doc = open(url, 'UserAgent' => 'RSStoDynarex'){|x| x.read }
    doc = RXFReader.read(url).first
    doc.encode!('UTF-8', 'binary', invalid: :replace,
          undef: :replace, replace: '')
    xml_buffer = xslt.transform(Nokogiri::XML(doc.to_s)).to_s

    @to_dynarex = Dynarex.new xml_buffer
  end

end

if __FILE__ == $0 then

  rtd = RSStoDynarex.new 'https://stallman.org/rss/rss.xml'
  dynarex = rtd.to_dynarex
  dynarex.save 'rms.xml'
end
