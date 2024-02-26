class CreateBirds < ActiveRecord::Migration[7.1]
  def change
    create_table :birds do |t|
      t.string :chant_url
      t.string :name
      t.string :common_family
      t.string :geography

      t.timestamps
    end
  end
end
