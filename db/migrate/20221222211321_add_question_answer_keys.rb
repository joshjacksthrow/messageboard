class AddQuestionAnswerKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :question
    add_foreign_key :answers, :questions
  end
end
