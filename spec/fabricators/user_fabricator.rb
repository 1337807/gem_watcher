Fabricator(:user) do |user|
  email { Faker::Internet.email }
  password Faker::Internet.password(8)
end
