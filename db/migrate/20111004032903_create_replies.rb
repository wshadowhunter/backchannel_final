class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :pid
      t.integer :uid
      t.integer :vote_num
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
