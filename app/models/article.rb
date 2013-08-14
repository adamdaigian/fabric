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

class Article < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :sentences
  attr_accessible :content, :url, :name, :tweet, :img
end
