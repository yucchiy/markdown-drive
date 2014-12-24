FactoryGirl.define do
  factory :user_setting do
    repository "https://github.com/yucchiy/technote"
  end

  factory :invalid_user_setting do
    repository ""
  end
end
