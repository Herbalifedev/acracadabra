# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

require 'rails_helper'

describe WelcomeHelper do

  describe "show_result" do

    let(:config) {
      { from_address: "jeremy@livefront.com",
        recipients: "jeremy@livefront.com" }
    }

    before { @config = config }

    describe "when recipients is blank" do

      before { config.delete(:recipients) }

      it "should render an error page" do
        expect(helper.show_result(@config)).to match /Setup incomplete!/
      end

    end

    describe "when from_address is blank" do

      before { config.delete(:from_address) }

      it "should render an error page" do
        expect(helper.show_result(@config)).to match /Setup incomplete!/
      end

    end

    describe "when from_address and recipients are set" do

      it "should render a success page" do
        expect(helper.show_result(config)).to match /Setup complete!/
      end
    end

  end

end
