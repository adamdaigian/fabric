# == Schema Information
#
# Table name: annotations
#
#  id          :integer          not null, primary key
#  content     :text
#  sentence_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class AnnotationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
