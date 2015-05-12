class Recipe < ActiveRecord::Base
	validates :title, presence: true

	belongs_to :user

	validates_with AttachmentSizeValidator, :attributes => :picture, :less_than => 2.megabytes
    has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" },
    										 :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
