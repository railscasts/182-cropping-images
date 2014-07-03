class User < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  before_save :crop_avatar
  image_accessor :avatar_image
    
  def crop_avatar
    self.avatar_image = self.avatar_image.thumb('600x600').process!(:crop, :width => crop_w, :height => crop_h, 
        :x => crop_x, :y => crop_y) if crop_x.present? && self.avatar_image
  end
  
  def avatar_thumb
    avatar_image.thumb('100x100') if avatar_image
  end
  
  def avatar_large
    avatar_image.thumb('600x600') if avatar_image
  end
  
end
