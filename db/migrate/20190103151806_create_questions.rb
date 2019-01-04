class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.references :quiz, foreign_key: true

      t.timestamps
    end

    create_table :answers do |t|
      t.string :title
      t.boolean :right
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
