class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name          :string, :required, :unique
    gender        :string
    birth_date    :date
    email_address :email_address, :required, :login => true
    phone         :string
    administrator :boolean, :default => false
    status        :boolean, :default =>true
    timestamps
  end
  attr_accessible :name, :gender, :birth_date, :email_address,:phone, :password, :password_confirmation, :current_password

  has_many :inscripcions, :dependent => :destroy, :inverse_of =>:user
  has_many :tallers, :through =>:inscripcions
  has_many :horarios, :through =>:inscripcions
  # This gives admin rights and an :active state to the first sign-up.
  # Just remove it if you don't want that
  before_create do |user|
    if !Rails.env.test? && user.class.count == 0
      user.administrator = true
      user.state = "active"
    end
  end


  # --- Signup lifecycle --- #

  lifecycle do

    state :active, :default => true

    create :signup, :available_to => "Guest",
           :params => [:name, :gender, :birth_date,:email_address, :phone,:password, :password_confirmation],
           :become => :active

    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.forgot_password(self, lifecycle.key).deliver
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder,
               :params => [ :password, :password_confirmation ]

  end

  # --- Permissions --- #

  def create_permitted?
    # Only the initial admin user can be created
    self.class.count == 0
  end

  def update_permitted?
    acting_user.administrator? || acting_user==self ||
      (acting_user == self && only_changed?(:name, :gender, :birth_date, :email_address, :phone, :crypted_password,
                                            :current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    #acting_user.administrator?
    if !acting_user.guest?
      if acting_user.administrator? || acting_user==self
        return true
      else
        return false
      end
    else
      true
    end
  end

  
  
end
