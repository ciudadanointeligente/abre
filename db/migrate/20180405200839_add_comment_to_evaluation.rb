class AddCommentToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :comment, :string
  end
end
