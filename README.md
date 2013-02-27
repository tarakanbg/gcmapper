# GCMapper 

A Ruby gem for easy generation of Great Circle Map images between 2 or more airports.
The gem provides an API for constructing the image URLs, the maps themselves are pulled from
[gcmap.com](http://www.gcmap.com/).

The look and size of the map image can be customized by passing an optional hash of arguments, as explained
in the [Usage section](#usage).

[![Build Status](https://secure.travis-ci.org/tarakanbg/gcmapper.png?branch=master)](http://travis-ci.org/tarakanbg/gcmapper)
[![Gemnasium](https://gemnasium.com/tarakanbg/gcmapper.png?travis)](https://gemnasium.com/tarakanbg/gcmapper)
[![Gem Version](https://badge.fury.io/rb/gcmapper.png)](http://badge.fury.io/rb/gcmapper)
[![Code Climate](https://codeclimate.com/github/tarakanbg/gcmapper.png)](https://codeclimate.com/github/tarakanbg/gcmapper)

## Requirements

[Ruby 1.9.3](http://www.ruby-lang.org/en/downloads/) or higher | **Supports Ruby 2.0!**

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
label are mutually exclusive.

### Defaults

* width: 720px
* height: 360px
* terrain: off
* city label: on
* airport name label: off

### Examples:

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

### v. 0.4.0 February 27rd 2013

* Ruby 2.0 support

### v. 0.3.1 September 23rd 2012

* More test cases
* Typos

### v. 0.3 August 27th 2012

* Updated for [vatsim_online](https://rubygems.org/gems/vatsim_online) compatibility

### v. 0.2 July 2nd 2012

* [Enhancement] Maps now show the user input code (ICAO or IATA) instead of ICAO only
* [Feature] New hash option `:city` to toggle city labels on or off (see [Usage](#usage))
* [Feature] New hash option `:airport_name` to toggle airport name labels on or off (see [Usage](#usage))

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Make sure all tests pass!
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## Credits

Copyright © 2013 [Svilen Vassilev](http://svilen.rubystudio.net)

*If you find my work useful or time-saving, you can endorse it or buy me a beer:*

[![endorse](http://api.coderwall.com/svilenv/endorse.png)](http://coderwall.com/svilenv)
[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5FR7AQA4PLD8A)

Released under the [MIT LICENSE](https://github.com/tarakanbg/gcmapper/blob/master/LICENSE)

Maps generated by the [Great Circle Mapper](http://www.gcmap.com/), copyright Karl L. Swartz
