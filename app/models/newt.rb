class Newt < ActiveRecord::Base
  has_many :UserNewts, :dependent => :destroy
  has_many :Users, :through => :UserNewts

  before_create :generate_random_ids, :generate_title

  validates :content, :presence => true
  #validates :uniq_id, :uniqueness => true, :presence => true

  def generate_random_ids
     self.uniq_id = SecureRandom.hex(5)
     self.uniq_secret = SecureRandom.hex(12)
  end 
  
  def generate_title
     self.title = ActionController::Base.helpers.strip_tags(content)[0..30] if self.title.blank?
  end 

end
