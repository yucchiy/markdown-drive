# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    username Faker::Name.name
    uid Faker::Number.number(10).to_s
    association :user

    factory :identity_dropbox do
      provider :dropbox
      access_token "bpd2jLxFfVcAAAAAAAAUatUHTG8Yr6QGSwE1sKOo_62wOxAJowV4ly2Ny9dEjIef"
      access_token_secret nil
    end
  end
end
