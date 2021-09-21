class User < ActiveRecord::Base
  
  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    # .strip is to ensure that any leading or trailing space will be ignored
    email_fixed = email.strip.downcase
    # The .where method below compares the formatted email with an email
    # in database that has ALSO been downcased.
    user = self.where("LOWER(email) LIKE ?", email_fixed).first
    
    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end

end
