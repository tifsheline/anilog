class Comment < ActiveRecord::Base
  belongs_to :status
  belongs_to :user
  validates_presence_of :user
  validates_presence_of :body
end
