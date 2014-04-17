class CreateUsersChoices < ActiveRecord::Migration
  def change
    create_table(:users_choices) do |t|
      t.integer :user_id
      t.references :test
      t.references :choice

      t.timestamps
    end

    add_index :users_choices, [:user_id, :test_id], unique: true
  end
end
