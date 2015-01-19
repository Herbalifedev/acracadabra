# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.
require 'queries/ReportQuery'
require 'services/PaginationService'

class ReportsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    begin
      #recipients = Rails.configuration.recipients
      #ReportMailer.report(recipients, params).deliver
      raise "Invalid params #{params[:report].inspect}" unless params[:report]
      processed = params[:report].inject({}) {|newhash, (k, v)| newhash[k.downcase.to_sym]=v; newhash}
      if processed
        CrashData.new do |crash_data|
          crash_data.update_attributes(processed)
          crash_data.settings_global = processed[:settings_global].inspect if processed[:settings_global]
          crash_data.device_features = processed[:device_features].inspect if processed[:device_features]
          crash_data.settings_secure = processed[:settings_secure].inspect if processed[:settings_secure]
          crash_data.settings_system = processed[:settings_system].inspect if processed[:settings_system]
          crash_data.shared_preferences = processed[:shared_preferences].inspect if processed[:shared_preferences]
          crash_data.crash_configuration = processed[:crash_configuration].inspect if processed[:crash_configuration]
          crash_data.build = processed[:build].inspect if processed[:build]
          crash_data.custom_data = processed[:custom_data].inspect if processed[:custom_data]
          crash_data.initial_configuration = processed[:initial_configuration].inspect if processed[:initial_configuration]
          crash_data.environment = processed[:environment].inspect if processed[:environment]
          crash_data.save!
        end
      else
        raise "Invalid data. #{processed.inspect}"
      end
      head :created
    rescue Exception => @error
      respond_to do |format|
        format.json do
          render :json => { error: { message: @error.inspect, code: 10001 } }, :status => 499
        end
      end
    end
  end

  def index
    begin
      report_query = ReportQuery.new(params)
      p_service = PaginationService.new(report_query.results, params)
      respond_to do |format|
        format.json do
          render :json => { data: { pages: p_service.pages, total: p_service.total, crash_data: p_service.results } }
        end
      end
    rescue Exception => @error
      respond_to do |format|
        format.json do
          render :json => { error: { message: @error.inspect, code: 10001 } }, :status => 499
        end
      end
    end
  end

  def charts
    data = ReportQuery.new(params, false).results
    @per_phone_model = data.group(:phone_model).count unless data.empty?
    @per_date = data.group_by_day(:created_at).count unless data.empty?
    @per_month = data.group_by_month(:created_at).count unless data.empty?
    @per_hour = data.group_by_hour_of_day(:created_at).count unless data.empty?

    @since = params[:since]
    @until = params[:until]
  end

end
