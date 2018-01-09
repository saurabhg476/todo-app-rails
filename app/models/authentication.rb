class Authentication < ApplicationRecord
  belongs_to :user
  validates :kind,:value, presence:true
end
