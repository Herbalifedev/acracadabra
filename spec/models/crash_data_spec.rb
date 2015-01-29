require 'rails_helper'

describe CrashData do
  describe 'attr_accessible' do
    accessible_attributes = [
      :android_version,
      :app_version_code,
      :app_version_name,
      :available_mem_size,
      :brand,
      :build,
      :crash_configuration,
      :custom_data,
      :device_features,
      :display,
      :dumpsys_meminfo,
      :environment,
      :file_path,
      :initial_configuration,
      :installation_id,
      :is_silent,
      :logcat,
      :package_name,
      :phone_model,
      :product,
      :report_id,
      :settings_secure,
      :settings_system,
      :shared_preferences,
      :stack_trace,
      :total_mem_size,
      :user_app_start_date,
      :user_comment,
      :user_crash_date,
      :user_email
    ]

    accessible_attributes.each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end
  end
end
