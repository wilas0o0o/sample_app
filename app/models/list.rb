class List < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  valitates :image_type

  private

  def image_type
    if !image.blob.content_type.in?(%('image/jpeg image/png'))
      image.purge # Rails6では不要
      errors.add(:image,'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end
end
