# email:string
# password_digest:string

# password:string virtual attribute
# password_confirmation:string virtual attribute

class User < ApplicationRecord
    has_secure_password

    validates :email, uniqueness: true, presence: true, format: {with: /\A\S+@.+\.\S+\z/, message: 'must be a valid email address'}

    validates :password, length: {minimum: 6, maximum: 15}

end
