# == Schema Information
#
# Table name: contests
#
#  calculated_prize_pool :decimal(8, 2)
#  created_at            :datetime         not null
#  current_entrants      :integer          indexed
#  duration_in_weeks     :integer          indexed
#  end_week              :integer
#  entry_deadline        :datetime
#  entry_fee             :decimal(8, 2)
#  guaranteed_prize_pool :decimal(8, 2)    indexed
#  id                    :bigint           not null, primary key
#  max_entrants          :integer          indexed
#  rake                  :decimal(8, 2)
#  start_week            :integer          indexed
#  updated_at            :datetime         not null
#  vegas_bucks           :decimal(8, 2)
#

class Contest < ApplicationRecord
end
