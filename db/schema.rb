# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150114025841) do

  create_table "crash_data", :force => true do |t|
    t.string   "user_email"
    t.text     "user_comment"
    t.text     "device_features"
    t.string   "phone_model"
    t.text     "settings_secure"
    t.string   "installation_id"
    t.text     "settings_system"
    t.text     "shared_preferences"
    t.string   "is_silent"
    t.string   "android_version"
    t.string   "package_name"
    t.string   "app_version_code"
    t.text     "crash_configuration"
    t.datetime "user_crash_date"
    t.text     "dumpsys_meminfo"
    t.text     "build"
    t.text     "stack_trace"
    t.string   "product"
    t.text     "display"
    t.text     "logcat"
    t.string   "app_version_name"
    t.string   "available_mem_size"
    t.datetime "user_app_start_date"
    t.text     "custom_data"
    t.string   "brand"
    t.text     "initial_configuration"
    t.string   "total_mem_size"
    t.text     "file_path"
    t.text     "environment"
    t.string   "report_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.text     "settings_global"
  end

end
