require "gcmapper/version"

class String
  def gcmap(args={})
    Gcmapper.gcmap(self, args)
  end
end

module Gcmapper
  def self.gcmap(route, args)
    args[:terrain].nil? || args[:terrain] == false  ? tr="wls" : tr="bm"
    args[:width].nil? ? width="720" : width=args[:width]
    args[:height].nil? ? height="360" : height=args[:height]
    style = parse_styles(args)
    url = "http://www.gcmap.com/map?P=#{route}%0d%0a&MS=#{tr}&MR=120&MX=#{width}x#{height}&PM=#{style}"
  end

  def self.parse_styles(args)
    style = 'b:disc7%2b' #basic
    args[:city] == false ? style += '%25U' : style += '"%25U%25+%28N"'
    style = 'b:disc7+%A' if args[:airport_name] == true
    style
  end
end

