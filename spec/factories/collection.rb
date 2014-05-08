FactoryGirl.define do

  factory :collection do |f|
    f.name "Test Collection"
    f.description "Just a quick test."

    user
  end

end