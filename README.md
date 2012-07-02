# GCMapper [![Build Status](https://secure.travis-ci.org/tarakanbg/gcmapper.png)](http://travis-ci.org/tarakanbg/gcmapper)

A Ruby gem for easy generation of Great Circle Map images between 2 or more airports.
The gem provides an API for constructing the image URLs, the maps themselves are pulled from
[gcmap.com](http://www.gcmap.com/).

The look and size of the map image can be customized by passing an optional hash of arguments, as explained
in the [Usage section](#usage).

## Installation

Add this line to your application's Gemfile:

    gem 'gcmapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gcmapper

## Usage

The `.gcmap` method can be applied to a string (or variable containing a string), representing a valid route
between 2 or more airports (ICAO or IATA codes), connected with dashes, like this: `EGLL-LOWI` or
`LFST-LSZH-LBSF`. Here are some examples:

```ruby
# An example of normal route:
route = "EGLL-LOWI"
route.gcmap # => Returns an image map URL for the route EGLL-LOWI

# An exampmle of layover route:
another_route = "LFST-LSZH-LBSF"
another_route.gcmap # => Returns an image map URL for the layover route LFST-LSZH-LBSF

# The method can be applied directly to a string:
"EGLL-LOWI".gcmap # => Returns an image map URL for the route EGLL-LOWI

# It's not case sensitive:
"egll-lowi".gcmap # => Returns an image map URL for the route EGLL-LOWI
```

The resulting image size and look can be customized by passing an optional hash of arguments to the
`.gcmap` method. Customizable attributes include *width, height, terrain (toggle satelite terrain
 overlay), city label and airport name label*.
Width, height and terrain can be combined in any way or omitted entirely. City label ad Airport name
label are mutually exclusive. Examples:

```ruby
# Passing width only (default is 720px):
route = "egll-lowi"
route.gcmap(:width => "600") # => Returns an image map URL with width set to 600px

# Passing height only (default is 360px):
route = "egll-lowi"
route.gcmap(:height => 400)  # => Returns an image map URL with height set to 400px

# Passing width and height:
"egll-lowi".gcmap(:width => "800", :height => "400") # => Returns an image map URL with width 800px and height 400px

# Enabling terrain overlay:
route = "egll-lowi"
route.gcmap(:terrain => true) # => Returns an image map URL with terrain overlay enabled

# Setting width, height and enabling terrain overlay:
"egll-lowi".gcmap(:width => 800, :height => 400, :terrain => true) # => Returns an image map URL with set width, height and terrain

# Setting width, height, enabling terrain overlay and disabling the city labels:
"egll-lowi".gcmap(:width => 800, :height=>400, :terrain=>true, :city=>false) # => Returns an image map URL with set width, height and terrain, with city labels disabled

# Setting the map to display the airports' names instead of the ICAO/IATA codes
route = "egll-lowi"
route.gcmap(:airport_name => true) # => Returns an image map URL with airport names displayed

# Setting the map to display the airports' names and a terrain overlay
route = "egll-lowi"
route.gcmap(:airport_name => true, :terrain => true) # => Returns an image map URL with airport names and terrain displayed
```

Finally, here's an example of how to use the gem in a Rails application:

*In your controller:*
```ruby
@route = "egll-lowi"
```

*In your view:*
```erb
<%= image_tag @route.gcmap(:width => "600") %>
```

#### Notes:

* the `route` string can be constructed from either ICAO or IATA airport codes; both types are recognized
* the `route` string is **not case sensitive**, so for example `lgav-lqsa` will be recognized as well
* layover routes that chain multiple airports (more than 2) are also supported
* default image parameters are: width 720px, width: 360px, terrain not shown
* when passing the `width` and `height` hash options the values can be put in quotes or not, either way works
* `city` label and `airport_name` label options are mutually exclusive, i.e. you can either have the ICAO/IATA code with optional city name OR the Airport name

## Changelog

### v. 0.2 July 2nd 2012

* [Enhancement] Maps now show the user input code (ICAO or IATA) instead of ICAO only
* [Feature] New hash option :city to toggle city labels on or off (see Usage)
* [Feature] New hash option :airport_name to toggle airport name labels on or off (see Usage)



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
