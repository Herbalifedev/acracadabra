class AddSettingsGlobalColumn < ActiveRecord::Migration
  def up
    add_column :crash_data, :settings_global, :text
  end

  def down
    remove_column :crash_data, :settings_global
  end
end
