# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  provider          :string(255)
#  uid               :string(255)
#  name              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  oauth_token       :string(255)
#  oauth_secret      :string(255)
#  profile_image_url :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
