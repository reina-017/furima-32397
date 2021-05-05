FactoryBot.define do
  factory :item do
    name            {Faker::Name.initials}
    description     {Faker::Lorem.sentence}

    category_id     {Faker::Number.between(from: 2, to: 11)}
    status_id       {Faker::Number.between(from: 2, to: 7)}
    cost_id         {Faker::Number.between(from: 2, to: 3)}
    area_id         {Faker::Number.between(from: 1, to: 47)}
    days_id         {Faker::Number.between(from: 2, to: 4)}
    item_price      {Faker::Number.between(from: 300, to: 9999999)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/furima-intro06.png'), filename: 'furima-intro06.png', content_type: 'image/png')
    end
    
  end
end
