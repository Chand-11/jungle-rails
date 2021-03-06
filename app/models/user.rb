class User < ActiveRecord::based
  has_secure_password

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true

  validates_length_of :password, minimum: 8

  validates_uniqueness_of :email, case-sensitive: false

  def self.authenticate_with_credentials(email, password)
    @user = self.find_by_email(email)

    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end

  end

end