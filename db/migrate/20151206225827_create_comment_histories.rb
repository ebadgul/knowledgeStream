class CreateCommentHistories < ActiveRecord::Migration
  def change
    create_table :comment_histories do |t|
      t.references :comment, index: true, foreign_key: true
      t.text :comment_str

      t.timestamps null: false
    end
  end
end
