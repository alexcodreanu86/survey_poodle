class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.string :category
      t.string :title
      t.boolean :is_public, default: true

      t.timestamps

    end
  end
end
