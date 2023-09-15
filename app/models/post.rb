class Post < ApplicationRecord

    validate :date_check
    validates :title, presence: true

    private

    def date_check
        if self.end_date < self.start_date
            errors.add(:end_date, "は開始日より前の日を設定することはできません")
        end
    end
    
end
