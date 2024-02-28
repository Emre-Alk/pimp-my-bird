class AddDefaultToChantBirds < ActiveRecord::Migration[7.1]
  def change
    change_column_default :birds, :chant_url, from: nil, to: "https://xeno-canto.org/839842/embed?simple=1"
  end
end
