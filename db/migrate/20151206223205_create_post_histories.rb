class CreatePostHistories < ActiveRecord::Migration
  def change
    create_table :post_histories do |t|
      t.references :post, index: true, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
