class CreateSmoothies < ActiveRecord::Migration[6.1]
  def change
    create_table :smoothies do |t|
      t.string :name
      t.string :img_url

      t.timestamps
    end
  end
end
