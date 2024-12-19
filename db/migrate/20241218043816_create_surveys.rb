class CreateSurveys < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:surveys)
      create_table :surveys do |t|
        t.references :user, null: false, foreign_key: true
        t.references :establishment, null: false, foreign_key: true
        t.string :title
        t.text :description

        t.timestamps
      end
    end
  end
end