class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.string :index
      t.string :about

      t.timestamps null: false
    end
  end
end
