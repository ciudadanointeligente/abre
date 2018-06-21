class CreateChallengeGroups < ActiveRecord::Migration
  def change
    create_table :challenge_groups do |t|

      t.timestamps null: false
    end
  end
end
