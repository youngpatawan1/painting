class CreateGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.string :title
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
