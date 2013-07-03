class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name
  # attr_accessible :title, :body

  has_many :visits
  has_many :people, through: :visits

  # Check to determine if we have a full name or not
  #
  # @return <Boolean>
  def full_name?
    full_name.blank?
  end


  # Create full name for the user
  #
  # @return <String> first + last
  def full_name
   [ first_name, last_name ].compact.join ' '
  end


  # Return the display name for this user
  #
  # @return <String>
  def display_name
    full_name? ? full_name : email
  end

end
