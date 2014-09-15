class Pin < ActiveRecord::Base
  attr_accessible :description, :yt_video_id, :image, :image_remote_url

  validates :description, presence: true, :unless => 'description.blank?'
	validates :user_id, presence: true
  validates :yt_video_id, presence: true, :unless => 'yt_video_id.blank?'
  validates_attachment :image, presence: true, :unless => 'image_remote_url.blank?',
  														content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  														size: { less_than: 5.megabytes } 

  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>"}
  has_reputation :votes, source: :user, aggregated_by: :sum


def yt_video_id
          yt_video_id = pin.yt_video_id unless yt_video_id.blank?
      end



  def image_remote_url=(url_value)
  	self.image = URI.parse(url_value) unless url_value.blank?
  	super
  end

end


