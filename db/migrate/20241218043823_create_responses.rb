class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
