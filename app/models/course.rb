class Course < ApplicationRecord
    belongs_to :user
    has_many :sections
    has_many :enrollments
    mount_uploader :image, ImageUploader
    validates :title, :description, presence: { message: "must be given please"}
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0, message: "please provide a valid number"}
    
    def free?
        cost.zero?
    end
    
    def premium?
        !free?
    end
end
