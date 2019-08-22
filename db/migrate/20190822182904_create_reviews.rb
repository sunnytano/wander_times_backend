class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :text
      t.belongs_to :user
      t.belongs_to :article

      t.timestamps
    end
  end
end
