class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  validates :title, presence: true

  def self.search(search)
    if search != ""
      Memo.where('title LIKE(?)', "%#{search}%")
    else
      Memo.all
    end
  end
end