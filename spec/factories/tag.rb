FactoryGirl.define do

  factory :tag do |f|
    f.name "Awesome!"
  end

  factory :tag_photo, class: Tag, parent: :tag do |f|

    photo
  end

  factory :tag_collection, class: Tag, parent: :tag do |f|

    collection
  end

end