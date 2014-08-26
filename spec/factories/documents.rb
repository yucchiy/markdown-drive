# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    path "/Public/latest.txt"
    rev "35c1f029684fe"
    revision 220191
    bytes 0
    size "0 bytes"
    is_deleted false
    association :user
    edited_at "Mon, 18 Jul 2011 20:13:43 +0000"

    factory :document_deleted do
      is_deleted true
    end
  end
end
