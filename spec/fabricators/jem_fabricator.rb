Fabricator(:jem) do
  name { Faker::Lorem.word }
  version { "#{Faker::Number.digit}.#{Faker::Number.digit}.#{Faker::Number.digit}" }
end
