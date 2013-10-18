class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :q_type
      t.string :q_title
      t.integer :survey_id
      t.timestamps
    end
  end
end
