require 'spec_helper.rb'

describe String do

  describe "route" do
    it "is a string" do
      input = "egll-lbsf"
      input.class.should eq(String)
    end
  end

  describe ".gcmap" do

    it "should return a valid full url" do
      route = "egll-lbsf"
      route.gcmap[0..6].should eq("http://")
    end

    it "should integrate the route correctly in the url" do
      route = "egll-lowi"
      route.gcmap.should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret default width" do
      route = "egll-lowi"
      route.gcmap.should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret default height" do
      route = "egll-lowi"
      route.gcmap.should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should be applicable directly to a string" do
      "egll-lowi".gcmap.should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret non-default width" do
      route = "egll-lowi"
      route.gcmap(:width=>"600").should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=600x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret simplified non-default width" do
      route = "egll-lowi"
      route.gcmap(:width=>600).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=600x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret non-default height" do
      route = "egll-lowi"
      route.gcmap(:height=>"600").should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x600&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret simplified non-default height" do
      route = "egll-lowi"
      route.gcmap(:height=>600).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x600&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret non-default width and height" do
      route = "egll-lowi"
      route.gcmap(:width=>"800", :height=>"400").should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=800x400&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should interpret non-default simplified width and height" do
      route = "egll-lowi"
      route.gcmap(:width => 800, :height => 400).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=800x400&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should support layover routes" do
      route = "egll-lowi-lqsa"
      route.gcmap.should eq("http://www.gcmap.com/map?P=egll-lowi-lqsa%0d%0a&MS=wls&MR=120&MX=720x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should display terrain if needed" do
      route = "egll-lowi"
      route.gcmap(:terrain=>true).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=bm&MR=120&MX=720x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should accept false option for terrain" do
      route = "egll-lowi"
      route.gcmap(:terrain=>false).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x360&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

    it "should allow random combination of arguments" do
      route = "egll-lowi"
      route.gcmap(:width=>800, :height=>400, :terrain=>true).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=bm&MR=120&MX=800x400&PM=b:disc7%2b%22%25i%25+%28N%22")
      route.gcmap(:width=>800, :terrain => true).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=bm&MR=120&MX=800x360&PM=b:disc7%2b%22%25i%25+%28N%22")
      route.gcmap(:height=>800, :terrain=>true).should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=bm&MR=120&MX=720x800&PM=b:disc7%2b%22%25i%25+%28N%22")
    end

  end

end
