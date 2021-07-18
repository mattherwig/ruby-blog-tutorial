class Comment < ApplicationRecord
  include Visible
  
  validates :commenter, presence: true
  validates :body, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  
  belongs_to :article
end
