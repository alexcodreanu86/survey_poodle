class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :unique_link
      t.integer :survey_id
    end
  end
end
