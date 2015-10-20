# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"] }
  validate :custom


  belongs_to :cat



  private
    def overlapping_requests
      CatRentalRequest.where("end_date > ?", self.start_date)
        .where("start_date < ?", self.end_date)
        .where("cat_id = ?", self.cat_id)
    end

    def overlapping_approved_requests
      overlapping_requests.where("status = 'APPROVED'")
    end

    def custom
      overlapping_approved_requests.empty?
    end
end
