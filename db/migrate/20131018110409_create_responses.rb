class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :user_input
      t.integer :question_id
      t.integer :submission_id
      t.integer :choice_id
      t.timestamps
    end
  end
end
