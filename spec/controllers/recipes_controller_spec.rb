require 'rails_helper'

describe RecipesController do

	it { should use_before_action(:authenticate_user!) }
	it { should_not use_before_action(:prevent_ssl) }

	describe 'POST #create' do
		it "creates a new recipe" do expect{ post :create, recipe: Factory.attributes_for(:recipe) 
			}.to change(recipe,:count).by(1) 
		end 
	end
end
