class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      # Khóa ngoại liên kết với bảng properties
      t.references :property, null: false, foreign_key: true

      # Giá thuê nhà và các phí kèm theo (đơn vị: yên)
      t.decimal :rental_price, precision: 12, scale: 2  # ví dụ: 70500
      t.decimal :management_fee, precision: 12, scale: 2 # ví dụ: 4500
      
      # Các chi phí ban đầu
      t.string  :deposit                        # Ví dụ: "miễn phí"
      t.decimal :key_fee, precision: 12, scale: 2  # Ví dụ: 80000
      
      # Thông tin về kiểu hình bất động sản
      t.string  :property_type                   # Ví dụ: "Căn hộ/Thép nhẹ"
      t.date    :built_date                      # Ví dụ: lưu ngày xây dựng (vd: 2011-05-01)
      
      # Thông tin vị trí
      t.string  :address                         # Ví dụ: "Uchihara, Thành phố Wakayama, Tỉnh Wakayama"
      
      # Thông tin giao thông
      t.text    :transportation_info             # Ví dụ: "Đi bộ 25 phút từ Kuroe...; Đi bộ 33 phút từ Kimiidera; ..."
      
      # Thông tin mặt bằng
      t.string  :floor_plan                      # Ví dụ: "2LDK"
      t.decimal :area, precision: 8, scale: 2      # Ví dụ: 55.4 (m²)
      t.text    :layout_details                  # Ví dụ: "LDK10.5 tatami, 6 tatami phương Tây, 6 tatami phương Tây"
      t.string  :orientation                     # Ví dụ: "phía đông"
      t.string  :floor_info                      # Ví dụ: "Tầng 1/2 tầng trên mặt đất"
      
      # Phí bãi đậu xe (nếu có)
      t.decimal :parking_fee, precision: 12, scale: 2  # Ví dụ: 8800

      # Các đặc trưng, cơ sở vật chất
      t.text    :features                      # Ví dụ: "Phòng tắm và nhà vệ sinh riêng biệt, Tầng 2,..."
      t.decimal :cleaning_fee, precision: 12, scale: 2  # Ví dụ: 44000
      t.decimal :key_card_fee, precision: 12, scale: 2  # Ví dụ: 16500
      t.decimal :renewal_fee, precision: 12, scale: 2   # Ví dụ: 44000
      
      # Thông tin hợp đồng
      t.string  :contract_duration             # Ví dụ: "2 năm"
      t.string  :move_in_info                  # Ví dụ: "Sẵn sàng để chuyển vào" hoặc "Tôi muốn biết khi nào có thể chuyển đến"
      
      # Thông tin chi phí ban đầu, bảo hiểm nhà ở,...
      t.text    :initial_cost                  # Ví dụ: "Vui lòng liên hệ với chúng tôi."
      t.text    :housing_insurance             # Ví dụ: "Vui lòng liên hệ với chúng tôi."
      
      t.timestamps
    end
  end
end
