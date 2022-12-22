class AddQuestionUserConstraint < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :user
    add_foreign_key :questions, :users
  end
end
