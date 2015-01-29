# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

require "rails_helper"

describe ReportMailer do

  subject { ReportMailer }

  context 'report' do
    it 'should send an email with the report' do
      params = { APP_VERSION: '1.0', APP_PACKAGE: 'com.example' }
      subject.report('foo@bar.com', params).deliver_now
      email = ActionMailer::Base.deliveries.last
      expect(email.to).to include 'foo@bar.com'
      expect(email.subject).to include('Android App Crash')
      expect(email.body).to include("APP_VERSION")
      expect(email.body).to include("1.0")
      expect(email.body).to include("APP_PACKAGE")
      expect(email.body).to include("com.example")
    end
  end

end
