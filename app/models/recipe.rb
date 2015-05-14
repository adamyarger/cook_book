class Recipe < ActiveRecord::Base
	validates :title, presence: true

	after_save :load_into_soulmate
	before_destroy :remove_from_soulmate

	belongs_to :user

	validates_with AttachmentSizeValidator, :attributes => :picture, :less_than => 2.megabytes
  has_attached_file :picture, :styles => { :medium => "250x250#", :thumb => "100x100#" }, 
                                                    :default_url => ":style/missing_recipe.png"
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  	private

  		def load_into_soulmate
				loader = Soulmate::Loader.new("recipes")
				loader.add("term" => title, "id" => self.id, "data" => {
					"link" => Rails.application.routes.url_helpers.recipe_path(self)
			   	})
			end
		 
			def remove_from_soulmate
				loader = Soulmate::Loader.new("recipes")
			    loader.remove("id" => self.id)
			end
end
