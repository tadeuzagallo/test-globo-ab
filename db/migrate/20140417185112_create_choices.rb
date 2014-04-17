class CreateChoices < ActiveRecord::Migration
  def change
    create_table(:choices) do |t|
      t.string :url
      t.integer :weight
      t.references :test

      t.timestamps
    end
  end
end
