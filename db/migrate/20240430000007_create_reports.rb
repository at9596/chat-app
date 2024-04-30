class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :reason
      t.string :details
      t.references :post, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
