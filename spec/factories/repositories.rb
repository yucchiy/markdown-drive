FactoryGirl.define do
  factory :repository do
    github_repository_id 20000106
    name "public-repo"
    full_name "baxterthehacker/public-repo"
    master_branch "master"
    association :user, :factory => :user
  end
end
