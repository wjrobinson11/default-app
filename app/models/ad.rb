# == Schema Information
#
# Table name: ads
#
#  ad_type           :string           indexed
#  created_at        :datetime         not null
#  description       :text
#  group_id          :integer          indexed
#  id                :bigint           not null, primary key
#  media_10_link     :string
#  media_10_subtitle :string
#  media_10_title    :string
#  media_10_url      :string
#  media_1_link      :string
#  media_1_subtitle  :string
#  media_1_title     :string
#  media_1_url       :string
#  media_2_link      :string
#  media_2_subtitle  :string
#  media_2_title     :string
#  media_2_url       :string
#  media_3_link      :string
#  media_3_subtitle  :string
#  media_3_title     :string
#  media_3_url       :string
#  media_4_link      :string
#  media_4_subtitle  :string
#  media_4_title     :string
#  media_4_url       :string
#  media_5_link      :string
#  media_5_subtitle  :string
#  media_5_title     :string
#  media_5_url       :string
#  media_6_link      :string
#  media_6_subtitle  :string
#  media_6_title     :string
#  media_6_url       :string
#  media_7_link      :string
#  media_7_subtitle  :string
#  media_7_title     :string
#  media_7_url       :string
#  media_8_link      :string
#  media_8_subtitle  :string
#  media_8_title     :string
#  media_8_url       :string
#  media_9_link      :string
#  media_9_subtitle  :string
#  media_9_title     :string
#  media_9_url       :string
#  platform          :string           indexed
#  scheduled_at      :datetime         indexed
#  updated_at        :datetime         not null
#

class Ad < ApplicationRecord
end
