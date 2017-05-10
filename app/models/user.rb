# frozen_string_literal: true

# User modeel. Role based
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %i[user editor admin].freeze
  enum role: ROLES

  ##
  # Creates methods to test of a user is allowed to act as a role.
  # Given ROLES = [:guest, :user, :admin, :owner], will create the methods
  # #can_be_guest?, #can_be_user?, #can_be_admin? and #can_be_owner?.
  #
  # The methods return true if the user's role is equal to or less
  # than the rank of thean_be method. So if a user is an admin, #can_be_user?
  # or #can_be_admin? would return true, but
  # can_be_owner? would return false.
  #
  ROLES.each do |role_name|
    define_method("can_be_#{role_name}?") do
      self.class.roles[role_name] <= self.class.roles[role]
    end
  end
end
