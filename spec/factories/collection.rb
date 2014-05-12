FactoryGirl.define do

  factory :collection do |f|
    f.name "Test Collection"
    f.description "Just a quick test."

    user
  end

  factory :update_collection, class: Collection, parent: :collection do |f|
    f.name "Update"
  end

end