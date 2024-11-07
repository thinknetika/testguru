class AddCurrentQuestionAndCorrectQuestionsToTestPassage < ActiveRecord::Migration[7.2]
  def change
    add_reference :test_passages,
                  :current_question,
                  null: false, foreign_key: { to_table: :questions }
    add_column :test_passages,
               :correct_questions,
               :integer,
               null: false, default: 0
  end
end
