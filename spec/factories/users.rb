FactoryGirl.define do
  factory :user do
    name "Taro Tanaka"
    screen_name "taro_tanaka"
    github_id "123456"
    github_token "himitsunotokenda"
    avatar_url "https://avatars1.githubusercontent.com/u/325819"
    association :user_setting, :factory => :user_setting, :strategy => :build
  end
end
