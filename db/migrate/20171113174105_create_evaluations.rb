class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :title
      t.boolean :proposal_participation
      t.integer :proposal_evaluation
      t.integer :proposal_web_evaluation
      t.text :proposal
      t.boolean :design_participation
      t.integer :design_evaluation
      t.text :design
      t.boolean :implementation_participation
      t.integer :implementation_municipality_evaluation
      t.integer :implementation_evaluation
      t.text :implementation
      t.boolean :experience

      t.timestamps null: false
    end
  end
end
