FactoryGirl.define do 

  factory :user do |f|
    f.email "johndoe@gmail.com"
    f.username "johndoe"
    f.password "doejohndoe"
  end 

  factory :character do |f|
  end 
end
