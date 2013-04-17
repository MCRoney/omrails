class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url

  validates :description, presence: true
	validates :user_id, presence: true
  validates_attachment :image, presence: true, 
  														content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  														size: { less_than: 5.megabytes } 

  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>"} 
  has_reputation :votes, source: :user, aggregated_by: :sum


  def image_remote_url=(url_value)
  	self.image = URI.parse(url_value) unless url_value.blank?
  	super
  end

def self.find_all_by_lowercasing_discription(str_array)
    wrapped = str_array.collect { |a| "'"+ "#{a.downcase}" + "'" }
    return MyModel.where("lower(\"my_models\".\"name\") IN (#{wrapped.join(', ')})")
end

end


