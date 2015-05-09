require 'rails_helper'
# require 'spec_helper'

describe RecipesController, type: :controller do

	# include Devise::TestHelpers
	it { should use_before_action(:authenticate_user!) }
	it { should_not use_before_action(:prevent_ssl) }

	describe 'POST #create' do
	    context 'with valid attributes' do
			before(:each) do
				# @request.env["devise.mapping"] = Devise.mappings[:user]
				user = FactoryGirl.create :user
				sign_in user
			end
	    	
			it 'creates the recipe' do
				post :create, recipe: attributes_for(:recipe)
				expect(Recipe.count).to eq(1)
			end

			it 'redirects to the "show" action for the new recipe' do
				post :create, recipe: attributes_for(:recipe)
				expect(response).to redirect_to Recipe.first
			end
	    end

	    context 'with invalid attributes' do
	    	before(:each) do
				# @request.env["devise.mapping"] = Devise.mappings[:user]
				user = FactoryGirl.create :user
				sign_in user
			end

	    	it 'does not create the recipe' do
	    		post :create, recipe: attributes_for(:recipe, title: nil)
	    		expect(Recipe.count).to eq(0)
	    	end

	    	it 're-renders the new view' do
	    		post :create, recipe: attributes_for(:recipe, title: nil)
	    		expect(response).to render_template :new
	    	end
	    end
	end
	
end
