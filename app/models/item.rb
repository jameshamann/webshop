class Item < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :order_items

  default_scope { where(active: true) }

end
