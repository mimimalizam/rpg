class Ability < ActiveRecord::Base
  belongs_to :character

  validates :name,
            :presence => true,
            :length => { :minimum => 3 }

  validates :level,
            :presence => true,
            :numericality => {
              :greater_then => 0,
              :less_than_or_equal_to => 100
            }

  def red?
    self.level <= 30
  end

  def yellow?
    self.level > 30 && self.level <= 70
  end

  def green?
    self.level > 70
  end
end
