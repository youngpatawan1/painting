class CreatePaintings < ActiveRecord::Migration[6.1]
  def change
    create_table :paintings do |t|
      t.string :title
      t.string :image_url
      t.belongs_to :user, foreign_key:true
      t.belongs_to :gallery
      t.timestamps
    end
  end
end
