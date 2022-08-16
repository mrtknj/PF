class Game < ApplicationRecord
  
  has_one_attached :image
  enum cero: { "CERO[A]": 0, "CERO[B]": 1, "CERO[C]": 2, "CERO[D]": 3,"CERO[Z]": 4 }
  
  validates :name, presence: true
  validates :summary, presence: true
  validates :price, presence: true

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def with_tax_price
      (price * 1.1).floor
  end

end
