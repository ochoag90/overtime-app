class CreateHands < ActiveRecord::Migration[5.0]
  def change
    create_table :hands do |t|
      t.string :hand_id
      t.string :integer
      t.integer :user_id

      t.timestamps
    end
  end
end
