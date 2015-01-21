class CrashDataController < ApplicationController
  active_scaffold :"crash_data" do |config|
    config.label = 'Crash Data report'
    config.actions = :list, :show, :field_search
    list.columns.exclude :build,
                         :crash_configuration,
                         :device_features,
                         :display,
                         :dumpsys_meminfo,
                         :environment,
                         :file_path,
                         :initial_configuration,
                         :logcat,
                         :package_name,
                         :settings_global,
                         :settings_secure,
                         :custom_data,
                         :is_silent,
                         :settings_system,
                         :shared_preferences,
                         :stack_trace,
                         :total_mem_size,
                         :user_comment,
                         :user_email,
                         :available_mem_size,
                         :created_at,
                         :updated_at
    list.sorting = {:android_version => 'ASC'}

    config.field_search.columns = :user_crash_date, :phone_model, :product, :brand

    columns[:android_version].label = 'AV'
    columns[:android_version].description = 'Android Version'

    columns[:app_version_code].label = 'Avc'
    columns[:app_version_code].description = 'App Version Code'

    columns[:app_version_name].label = 'Avn'
    columns[:app_version_name].description = 'App Version Name'

    columns[:user_app_start_date].label = 'User App Start Date'
    columns[:user_app_start_date].description = 'User App Start Date'

    columns[:user_crash_date].label = 'User Crash Date'
    columns[:user_crash_date].description = 'User Crash Date'

    columns[:user_crash_date].form_ui = :datetime_picker
  end
end
