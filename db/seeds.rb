# Xóa sạch dữ liệu ở các bảng con
Detail.destroy_all
ContactRequest.destroy_all

# Xóa dữ liệu ở bảng properties
Property.destroy_all

# Tạo property mẫu và lưu đối tượng vào biến để liên kết
details_property = Property.create!(
  title: 'Skylight Tower',
  location: 'Quận 1, TP.HCM',
  price: 5.5,
  area: 40,
  built_year: 2009,
  description: 'Công trình hiện đại với thiết kế đẹp mắt, vị trí trung tâm thuận tiện.',
  image_url: 'https://placehold.co/300x200?text=Skylight+Tower',
  contact_phone: '0909123456'
)

Property.create!(
  title: 'Champ Crystal',
  location: 'Quận 3, TP.HCM',
  price: 7.0,
  area: 45,
  built_year: 2012,
  description: 'Chung cư cao cấp với các tiện ích nội khu phong phú.',
  image_url: 'https://placehold.co/300x200?text=Champ+Crystal',
  contact_phone: '0912345678'
)

Property.create!(
  title: 'F-Plus Home',
  location: 'Đống Đa, Hà Nội',
  price: 4.0,
  area: 38,
  built_year: 2015,
  description: 'Căn hộ với thiết kế hiện đại, giá cả phải chăng.',
  image_url: 'https://placehold.co/300x200?text=F-Plus+Home',
  contact_phone: '0987654321'
)

# Tạo record Detail liên kết với property đầu tiên
Detail.create!(
  property: details_property,  # hoặc property_id: details_property.id
  rental_price: 70500,
  management_fee: 4500,
  deposit: "miễn phí",
  key_fee: 80000,
  property_type: "Căn hộ/Thép nhẹ",
  built_date: Date.new(2011, 5, 1),
  address: "Uchihara, Thành phố Wakayama, Tỉnh Wakayama",
  transportation_info: "Đi bộ 25 phút từ Kuroe trên Tuyến chính Kisei; Đi bộ 33 phút từ Kimiidera; Đi bộ 49 phút từ Kainan trên Tuyến chính Kisei",
  floor_plan: "2LDK",
  area: 55.4,
  layout_details: "LDK10.5 tatami, 6 tatami phương Tây, 6 tatami phương Tây",
  orientation: "phía đông",
  floor_info: "Tầng 1/2 tầng trên mặt đất",
  parking_fee: 8800,
  features: "Phòng tắm và nhà vệ sinh riêng biệt, Tầng 2 hoặc cao hơn, Có bãi đậu xe, Điều hòa, Vật nuôi có thể thương lượng, Tự động khóa, Chức năng hâm nóng, Không gian máy giặt trong nhà.",
  cleaning_fee: 44000,
  key_card_fee: 16500,
  renewal_fee: 44000,
  contract_duration: "2 năm",
  move_in_info: "Sẵn sàng để chuyển vào",
  initial_cost: "Vui lòng liên hệ với chúng tôi.",
  housing_insurance: "Vui lòng liên hệ với chúng tôi."
)
