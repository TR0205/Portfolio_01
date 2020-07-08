# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, { presence: true, length: { maximum: 140 } }
  validates :user_id, { presence: true }

  def user
    User.find_by(id: user_id)
  end

  def self.search(search)
    if search
      Post.where(['content LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
