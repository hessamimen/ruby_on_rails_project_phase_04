class AdminUser < ApplicationRecord
        has_secure_password
        

        # validates :first_name, presence: true
        # validates :last_name, presence: true
        # validates :user_name, presence: true
        # validates :email, presence: true, format: {with: /[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+/, message: 'must be a valid email address'}

        EMAIL_REGEX = /[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+/
        validates :first_name,  :presence => true,
                                :length => { :maximum => 25 }
        validates :last_name,   :presence => true,
                                :length => { :maximum => 50 }
        validates :username,    :length => { :within => 8..25 },
                                :uniqueness => true
        validates :email,       :presence => true,
                                :length => { :maximum => 100 },
                                :format => EMAIL_REGEX
end
