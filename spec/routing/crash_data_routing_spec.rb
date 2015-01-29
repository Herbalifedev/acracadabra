require "rails_helper"

describe CrashDataController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/crash_data")).to route_to("crash_data#index")
    end

    it "routes to #new" do
      expect(get("/crash_data/new")).to route_to("crash_data#new")
    end

    it "routes to #show" do
      expect(get("/crash_data/1")).to route_to("crash_data#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/crash_data/1/edit")).to route_to("crash_data#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/crash_data")).to route_to("crash_data#create")
    end

    it "routes to #update" do
      expect(put("/crash_data/1")).to route_to("crash_data#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/crash_data/1")).to route_to("crash_data#destroy", :id => "1")
    end

  end
end
