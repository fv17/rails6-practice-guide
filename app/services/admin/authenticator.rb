class Admin::Authenticator
  def initialize(administrator)
    @administrator = administrator
  end

  def authenticate(raw_passoword)
    @administrator &&
      @administrator.hashed_password &&
      BCrypt::Password.new(@administrator.hashed_password) == raw_passoword
  end
end