class AddColToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :text, :string
    add_reference :tweets, :user, foreign_key: true
  end
end
