class Newt < ActiveRecord::Base
has_many :UserNewts, :dependent => :destroy
has_many :Users, :through => :UserNewts

before_create :generate_random_ids

  def generate_random_ids
     self.uniq_id = SecureRandom.hex(5)
     self.uniq_secret = SecureRandom.hex(12)
  end 

end
