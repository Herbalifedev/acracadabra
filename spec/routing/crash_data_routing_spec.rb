require "spec_helper"

describe CrashDataController do
  describe "routing" do

    it "routes to #index" do
      get("/crash_data").should route_to("crash_data#index")
    end

    it "routes to #new" do
      get("/crash_data/new").should route_to("crash_data#new")
    end

    it "routes to #show" do
      get("/crash_data/1").should route_to("crash_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/crash_data/1/edit").should route_to("crash_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/crash_data").should route_to("crash_data#create")
    end

    it "routes to #update" do
      put("/crash_data/1").should route_to("crash_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/crash_data/1").should route_to("crash_data#destroy", :id => "1")
    end

  end
end
