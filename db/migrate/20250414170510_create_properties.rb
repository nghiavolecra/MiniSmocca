class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string   :title,      null: false
      t.text     :description
      t.string   :image_url
      t.string   :location
      t.decimal  :price,      precision: 10, scale: 2  # ví dụ cho giá, cho phép giá trị lớn và 2 chữ số thập phân
      t.integer  :area

      t.timestamps
    end
  end
end
