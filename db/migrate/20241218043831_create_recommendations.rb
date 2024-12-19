class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:recommendations)
      create_table :recommendations do |t|
        t.string :title
        t.text :content
        t.string :category

        t.timestamps
      end
    end
  end
end
