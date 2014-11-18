class User < ActiveRecord::Base
	acts_as_authentic do |c|
    c.login_field = 'email'
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4}
end
	
  	attr_accessible :username,:email, :password, :password_confirmation,:firstname,:lastname,:openid_identifier
	has_many :assigns
	has_many :projects,through: :assigns
  has_many :subtask_users
  has_many :subtasks,through: :subtask_users

	def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self).deliver
  end

  def activate!
    self.active = true
    save
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self).deliver
  end

  def deliver_welcome!
    reset_perishable_token!
    Notifier.welcome(self).deliver
  end
end
