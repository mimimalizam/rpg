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
   if self.level <= 30
     true 
   else
     false
   end
  end

  def yellow?
    if self.level > 30 && self.level <= 70
      true
    else
      false
    end
  end

  def green?
    if self.level > 70
      true
    else
      false
    end
  end
end
