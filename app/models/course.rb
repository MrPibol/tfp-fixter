class Course < ApplicationRecord
    belongs_to :user
    has_many :sections
    validates :title, :description, presence: { message: "must be given please"}
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0, message: "please provide a valid number"}
end
