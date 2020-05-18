# frozen_string_literal: true

require 'gcmapper/version'

class String
  def gcmap(args = {})
    Gcmapper.gcmap(self, args)
  end
end

module Gcmapper
  def self.gcmap(route, args)
    tr = args[:terrain].nil? || args[:terrain] == false ? 'wls' : 'bm'
    width = args[:width].nil? ? '720' : args[:width]
    height = args[:height].nil? ? '360' : args[:height]
    style = parse_styles(args)
    url = "http://www.gcmap.com/map?P=#{route}%0d%0a&MS=#{tr}&MR=120&MX=#{width}x#{height}&PM=#{style}"
  end

  def self.parse_styles(args)
    style = 'b:disc7%2b' # basic
    style += args[:city] == false ? '%25U' : '"%25U%25+%28N"'
    style = 'b:disc7+%A' if args[:airport_name] == true
    style
  end
end
