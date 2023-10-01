class Post < ApplicationRecord

    validate :start_end_check
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    validates :title, length:{maximum: 20}
    validates :memo, length:{maximum: 500}
    private

    def start_end_check
        if start_date && end_date && start_date > end_date
            errors.add(:end_date, "は開始日より前の日を設定することはできません") 
        end
    end
    
end
