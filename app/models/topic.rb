class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :description, length: { minimum: 20 }, presence: true
  validates :name, length: { minimum: 5}, presence: true
end
