class CreateCrashData < ActiveRecord::Migration
  def change
    create_table :crash_data do |t|
      t.string :user_email
      t.text :user_comment
      t.text :device_features
      t.string :phone_model
      t.text :settings_secure
      t.string :installation_id
      t.text :settings_system
      t.text :shared_preferences
      t.string :is_silent
      t.string :android_version
      t.string :package_name
      t.string :app_version_code
      t.text :crash_configuration
      t.timestamp :user_crash_date
      t.text :dumpsys_meminfo
      t.text :build
      t.text :stack_trace
      t.string :product
      t.text :display
      t.text :logcat
      t.string :app_version_name
      t.string :available_mem_size
      t.timestamp :user_app_start_date
      t.text :custom_data
      t.string :brand
      t.text :initial_configuration
      t.string :total_mem_size
      t.text :file_path
      t.text :environment
      t.string :report_id

      t.timestamps
    end
  end
end
