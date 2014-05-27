Fabricator(:list) do
  body { Faker::Lorem.word(10).join("\n") }
  url { Faker::Internet.url }
end
