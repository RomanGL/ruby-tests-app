class CreateQuizPerforms < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_performs do |t|
      t.references :user, foreign_key: true
      t.references :quiz, foreugn_key: true

      t.timestamps
    end

    create_table :question_answers, id: false do |t|
      t.references :quiz_perform, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
    end
  end
end
