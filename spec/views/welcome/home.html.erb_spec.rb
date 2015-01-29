# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

require 'rails_helper'

describe "welcome/home" do

  let(:config) {
    { from_address: "john@example.com",
      recipients: "john@example.com" }
  }

  it "should have a div with the correct classes" do
    assign(:config, config)
    render
    #rendered.should have_selector 'div', class: "center hero-unit"
  end

  describe "when setup is incomplete" do

    describe "with recipients not defined" do

      before {
        config.delete(:recipients)
        assign(:config, config)
        render
      }

      it "should display an error" do
        expect(rendered).to have_selector 'h1.error'
      end

    end

    describe "with from_address not defined" do
      before {
        config.delete(:from_address)
        assign(:config, config)
        render
      }

      it "should display an error" do
        expect(rendered).to have_selector 'h1.error'
      end
    end

  end

  describe "when setup is complete" do

    before do
      assign(:config, config)
      render
    end

    it "should display success" do
      expect(rendered).to_not have_selector 'h1.error'
    end

    it "should provide instructions on Android app setup" do
      expect(rendered).to have_content "Configuring your Android app"
    end

  end

end
