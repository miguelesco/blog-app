class Comment < AplicationRecord
  belongs_to :user
  belongs_to :post
end