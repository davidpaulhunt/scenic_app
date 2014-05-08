FactoryGirl.define do

  factory :user do |f|
    f.email "test@email.com"
    f.password "password"
    f.password_confirmation "password"
    f.terms 1

    ignore do
      collections_count 3
    end

    after(:create) do |user, evaluator|
      create_list(:collection, evaluator.collections_count, user: user)
    end
  end

  factory :user_with_collections, class: User do |f|
    ignore do
      collections_count 3
    end

    after(:create) do |user, evaluator|
      create_list(:collection, evaluator.collections_count, user: user)
    end
  end

  factory :no_email_user, class: User do |f|
    f.email nil
  end

  factory :no_password_confirmation_user, class: User do |f|
    f.password_confirmation nil
  end

  factory :decline_terms_user, class: User do |f|
    f.terms 0
  end

end