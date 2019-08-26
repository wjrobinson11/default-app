FactoryBot.define do
  factory :contest do
    start_week { 1 }
    end_week { 1 }
    entry_fee { 11.00 }
    guaranteed_prize_pool { 100.00 }
    current_entrants { 0 }
    max_entrants { 10 }
    vegas_bucks { 1000 }
    calculated_prize_pool { 0 }
    duration_in_weeks { 1 }
    entry_deadline { "Sun, 08 Sep 2019 12:00:00 -0500".to_datetime }
  end
end