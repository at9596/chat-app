class CreateAccessLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :access_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ip_address
      t.string :browser
      t.string :login_with
      t.datetime :login_time
      t.string :country_name

      t.timestamps
    end
  end
end
