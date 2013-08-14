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

class Sentence < ActiveRecord::Base
  belongs_to :article
  has_many :annotations
  attr_accessible :content
end
