class AddForChallengeToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :for_challenge, :boolean
  end
end
