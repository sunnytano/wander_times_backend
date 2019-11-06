class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :overview
      t.string :url
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
