require 'rails_helper'
require 'spec_helper'

describe RecipesController, type: :controller do

	it { should use_before_action(:authenticate_user!) }
	it { should_not use_before_action(:prevent_ssl) }

	# TODO (Adam Yarger): add POST #create test
	
	
end
