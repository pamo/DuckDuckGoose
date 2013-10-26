class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :userid
      t.integer :filterid

      t.timestamps
    end
  end
end
