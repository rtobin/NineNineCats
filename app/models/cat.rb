class Cat < ActiveRecord::Base
  SEC_TO_YR = 60*60*24*365

  CAT_COLORS = ['brown', 'black',
    'orange', 'green', 'white', 'striped', 'spotted']

  validates :name, :sex, :birth_date, presence: true
  validates :color, inclusion: { in: CAT_COLORS }
  validates :sex, inclusion: { in: ['M', 'F']}

  def age
    ((Time.now - self.birth_date) / SEC_TO_YR).floor
  end


end
