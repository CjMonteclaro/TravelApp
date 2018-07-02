class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_one :profile, dependent: :destroy
   accepts_nested_attributes_for :profile, allow_destroy: true, reject_if: :all_blank

   has_and_belongs_to_many :roles
   accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank

   has_many :quotes, dependent: :destroy
   has_many :policies, dependent: :destroy

   validates_uniqueness_of :username, :email

   # Requirements of Devise for using :validatable module
   def email_required?
    false
   end

   def will_save_change_to_email?
    false
   end

   def has_role?(role)
     roles.map { |role| role.name.to_sym }.include? role
   end

end
