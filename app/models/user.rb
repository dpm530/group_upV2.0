class User < ApplicationRecord
   belongs_to :location, required: true
   has_many :groups, dependent: :destroy
   has_many :members, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :attendances, dependent: :destroy
   has_many :discussions, dependent: :destroy

   has_secure_password

   validates :firstName, presence: true, length: { minimum: 2 }
   validates :lastName, presence: true, length: { minimum: 2 }
   validates :email, presence: true, uniqueness: true
   validates_format_of :email,with:  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
   validates :password, presence: true

   mount_uploader :image, UserUploader

   before_save :downcase_fields

   def downcase_fields
      self.firstName.downcase!
      self.lastName.downcase!
      self.email.downcase!
   end

end
