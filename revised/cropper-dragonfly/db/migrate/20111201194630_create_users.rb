class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar_image_name
      t.string :avatar_image_uid

      t.timestamps
    end
  end
end
