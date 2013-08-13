# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  tweet      :string(255)
#  img        :string(255)
#

class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :url, :name, :tweet, :img
end
