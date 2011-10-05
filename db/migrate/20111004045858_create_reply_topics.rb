class CreateReplyTopics < ActiveRecord::Migration
  def change
    create_table :reply_topics do |t|
      t.integer :uid
      t.integer :pid
      t.string :title
      t.integer :vote_num
      t.text :content

      t.timestamps
    end
  end
end
