class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :subscriptions, :extend => MoneyModule
  has_many :courses, :through => :subscriptions, :uniq => true
  has_many :payments
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  # Constant containing roles for teh app. I might move this to the db later for more flexibility
  ROLES = %w[admin staff teacher student contributor]

  # Validations

  validates_presence_of :email, :first_name, :last_name

  # Methods

  def has_courses?
    unless self.subscriptions.blank?
      return false
    else
      return true
    end
  end

  def is_admin?(user)
    if user.role == 'admin'
      return true
    else
      return false
    end
  end

  def full_name
    [self.first_name,self.last_name].join(' ')
  end
  
end
