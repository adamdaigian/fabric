# == Schema Information
#
# Table name: sentences
#
#  id         :integer          not null, primary key
#  content    :text
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SentenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
