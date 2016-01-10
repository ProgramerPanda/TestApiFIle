class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.attachment :avatar
      t.string :avatar_path

      t.timestamps
    end
  end
end
