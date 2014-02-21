require "spec_helper"

describe SociosController do
  describe "routing" do

    it "routes to #index" do
      get("/socios").should route_to("socios#index")
    end

    it "routes to #new" do
      get("/socios/new").should route_to("socios#new")
    end

    it "routes to #show" do
      get("/socios/1").should route_to("socios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/socios/1/edit").should route_to("socios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/socios").should route_to("socios#create")
    end

    it "routes to #update" do
      put("/socios/1").should route_to("socios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/socios/1").should route_to("socios#destroy", :id => "1")
    end

  end
end
