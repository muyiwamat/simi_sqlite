FactoryGirl.define do
	factory :student do
		name "Simileoluwa"
		student_id 51126138
		password "ayodele"
		password_confirmation "ayodele"
	end
	factory :user do
		email "ayodele"
		password "ayodele"
		password_confirmation "ayodele"
		address "ROOM 92E Esslemont House"
		postcode "AB24 1WU"
	end
end