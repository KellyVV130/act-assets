class User < ApplicationRecord
  # 自连接
  belongs_to :supervisor, class_name: 'User', optional: true
  has_many :students, class_name: 'User', foreign_key: :supervisor_id

  belongs_to :group, optional: true

  has_and_belongs_to_many :seats

  validates_presence_of :name, :email
end
