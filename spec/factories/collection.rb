FactoryGirl.define do

  factory :collection do |f|
    f.name "Test Collection"
    f.description "Just a quick test."

    ignore do
        photos_count 3
    end

    # after(:build) do |collection, evaluator|
    #   create_list(:photo, evaluator.photos_count, collections: [collection])
    #   after(:build) do |photo|
    #     photo.photo_upload = "string"
    #   end
    # end

    user

  end

end