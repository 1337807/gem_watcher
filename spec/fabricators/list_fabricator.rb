Fabricator(:list) do
  body { Faker::Lorem.words(10).join("\n") }
  url { Faker::Internet.url }
end
