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

    url = "http://www.gcmap.com/map?P=#{route}%0d%0a&MS=#{tr}&MR=120&MX=#{width}x#{height}&PM=b:disc7%2b%22%25i%25+%28N%22"
  end
end

