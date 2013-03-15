FactoryGirl.define do
	factory :user do
		email "ayo@yahoo.com"
		password "ayodele"
		password_confirmation "ayodele"
		address "ROOM 92E Esslemont House"
		postcode "AB24 1WU"
	end
end

FactoryGirl.define do
	factory :library do
		name "Airyhall Library"
		address "Springfield Road, Aberdeen"
		postcode "AB15 7RF"
		dialling "1224"
		telephone "310536"
		email "AiryhallLibrary@aberdeencity.gov.uk"
		access_details "Car park, Disabled access"
	end
end