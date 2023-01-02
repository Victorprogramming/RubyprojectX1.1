#email:string
#password_digest:string
#password:string are virtual atribute
#password_confgirmation:string are virtual atribute 
class User < ApplicationRecord

    has_many :twitter_accounts
    
    has_secure_password

    validates_format_of :email, presence: true, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
