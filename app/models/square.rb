class Square
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  field :size, type: Integer, default: 1

  validates :size, :inclusion => 1..2
end
