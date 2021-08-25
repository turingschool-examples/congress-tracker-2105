class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    # validates_presence_of :password, require: true

    has_secure_password

    enum role: ["default", "admin"]

end