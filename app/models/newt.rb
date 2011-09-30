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
  
  def send_content_editor_link_mail(user, newt)
    NewtonMailer.content_editor_link(user, newt).deliver
  end

  class << self  
    def owner(newt)
      user_newt = UserNewt.find(:first, :conditions => ['newt_id = ? AND owner = ?', newt.id, true])
      newt_owner = User.find(user_newt.user_id)
    end
  end
end
