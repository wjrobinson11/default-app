FactoryBot.define do
  factory :admin do
    first_name  { "Adam" }
    last_name  { "Min" }
    username  { "admin65" }
    dob  { "2000-09-09" }
    email  { "admin@test.com" }
    password  { "password" }
    agreed_tas  { true }
    type  { "Admin" }
  end

  factory :player do
    first_name  { "Perry" }
    last_name  { "Layer" }
    username  { "player56" }
    dob  { "2000-09-09" }
    email  { "player@test.com" }
    password  { "password" }
    agreed_tas  { true }
    type  { "Player" }
  end
end