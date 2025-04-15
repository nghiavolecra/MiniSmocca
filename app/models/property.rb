class Property < ApplicationRecord
    # Bạn có thể thêm các validations cơ bản:
    has_one :detail, dependent: :destroy
    validates :title, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :area, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  
    # Nếu cần, bạn có thể thêm các scope cho chức năng tìm kiếm, lọc
    scope :by_location, ->(loc) { where("location ILIKE ?", "%#{loc}%") if loc.present? }
    scope :by_price_range, ->(min, max) {
      where("price >= ? AND price <= ?", min, max) if min.present? && max.present?
    }
    scope :by_area, ->(min_area) {
      where("area >= ?", min_area) if min_area.present?
    }
  end
  