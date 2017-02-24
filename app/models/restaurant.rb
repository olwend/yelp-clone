require_relative "with_user_association"

class Restaurant < ActiveRecord::Base

  validates :name, length: { minimum: 3 }, uniqueness: true
  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

      def build_review(attributes = {}, user)
       review = reviews.build(attributes)
       review.user = user
       review
     end


end
