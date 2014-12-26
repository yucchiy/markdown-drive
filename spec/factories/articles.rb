FactoryGirl.define do
  factory :article do
    title "How to develop webapp using rails"
    path "README.md"
    content "#How to develop webapp using rails\n##Install\nhogepiyo\n"
    edited_at 1.days.ago

    association :user, :factory => :user
  end
end
