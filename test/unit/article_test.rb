# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  tweet      :string(255)
#  img        :string(255)
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
