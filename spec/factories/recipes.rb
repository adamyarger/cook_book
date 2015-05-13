FactoryGirl.define do
  factory :recipe do
    title "MyString"
	description "MyText"
	ingredients "MyText"
	cooktime 30
	user_id 1
	servings 3
	directions "MyText"
  end

end
