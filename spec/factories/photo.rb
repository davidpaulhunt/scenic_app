FactoryGirl.define do

  factory :photo do |f|
    f.photo_upload "photo"

    collections {[FactoryGirl.create(:collection)]}

  end

end