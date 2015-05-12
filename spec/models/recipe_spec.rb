require 'rails_helper'

# RSpec.describe Recipe, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Recipe do
	it 'has a valid factory' do
		expect(build(:recipe)).to be_valid
	end

	it 'is invalid without a title' do
		expect(build(:recipe, title: nil)).to_not be_valid
	end

	it { should belong_to(:user) }

	it { should have_attached_file(:picture) }
	it { should validate_attachment_content_type(:picture).
	            allowing('image/png', 'image/gif').
	            rejecting('text/plain', 'text/xml') }
	it { should validate_attachment_size(:picture).
                less_than(2.megabytes) }
end
