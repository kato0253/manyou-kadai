class Task < ApplicationRecord

  validates :name, presence: true
  validates :detail, presence: true

  enum priority: { 高: 1, 中: 2, 低: 3 }
  enum status: { 完了: 1, 着手中: 2, 未着手: 3 }

  scope :name_search,  -> (text) {where("name LIKE ?", "%#{text}%")}
  scope :status_search,  -> (text) {where(status: text)}

  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

end
