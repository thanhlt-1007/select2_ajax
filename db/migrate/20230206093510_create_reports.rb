class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
