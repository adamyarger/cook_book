class User < ActiveRecord::Base

	has_many :recipes, dependent: :destroy	

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
	  has_attached_file :avatar, :styles => { :medium => "250x250#", :thumb => "100x100#" }, 
	                                                    :default_url => ":style/missing_avatar.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
