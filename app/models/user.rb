class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :subscriptions
  has_many :courses, :through => :subscriptions, :uniq => true
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :first_name, :last_name

  # Constant containing roles for teh app. I might move this to the db later for more flexibility
  ROLES = %w[admin staff teacher student]

  # Validations

  validates_presence_of :email, :role, :first_name, :last_name

  # Methods

  def find_subscriptions
    Subscription.where(:user_id => self.id)
  end

  def has_courses?
    unless self.find_subscriptions.blank?
      return false
    else
      return true
    end
  end

end
