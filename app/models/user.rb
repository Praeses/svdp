class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
    #:first_name, :last_name, :login

  # attr_accessible :title, :body

  has_many :visits
  has_many :people, through: :visits
  has_many :case_files, through: :visits

  class << self
    def find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      logger.debug conditions
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
  end

  # Check to determine if we have a full name or not
  #
  # @return <Boolean>
  def full_name?
    !full_name.blank?
  end


  # Create full name for the user
  #
  # @return <String> first + last
  def full_name
   [ first_name, last_name ].compact.join(' ').strip
  end


  # Return the display name for this user
  #
  # @return <String>
  def display_name
    full_name? ? full_name : username
  end

end
