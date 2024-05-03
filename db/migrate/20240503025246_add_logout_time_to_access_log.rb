class AddLogoutTimeToAccessLog < ActiveRecord::Migration[7.0]
  def change
    add_column :access_logs, :logout_time, :datetime
  end
end
