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

class Annotation < ActiveRecord::Base
  belongs_to :user
  belongs_to :sentence
  attr_accessible :content
end
