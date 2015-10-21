class Picture < ActiveRecord::Base
  has_attached_file :pic, styles: { small: "200x200#", medium: "500x500#", big: "800x800>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

  belongs_to :product
end
