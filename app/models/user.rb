# == Schema Information
# Schema version: 20090828145656
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  login             :string(255)     not null
#  crypted_password  :string(255)     not null
#  password_salt     :string(255)     not null
#  persistence_token :string(255)     not null
#  login_count       :integer(4)      default(0), not null
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#

class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject

  has_and_belongs_to_many :roles

  def is?(role_name, obj)
    self.roles.reject{|r| (r.authorizable_type == obj.class.name && r.authorizable_id == obj.id && r.name == role_name.to_s) ? false : true }.length >= 1
  end

end
