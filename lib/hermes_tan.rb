require 'gmail'

class NoCredentialsProvidedError < StandardError; end
class InvalidEmailError < StandardError; end

# The main Hermes driver
class HermesTan

  # Say hi to the world!
  #
  # Example:
  #   >> HermesTan.new("email@gmail.com", "password").let_gods_know_about(['1@gmail.com'], 'subject', 'body')
  #   => <- "RCPT TO:<1@gmail.com>\r\n"
  #      -> "250 2.1.5 OK c77sm415106lfb.41 - gsmtp\r\n"
  #      <- "DATA\r\n"
  #      -> "354  Go ahead c77sm415106lfb.41 - gsmtp\r\n"
  #      writing message from String
  #      wrote 519 bytes
  #      -> "250 2.0.0 OK 1447852102 c77sm415106lfb.41 - gsmtp\r\n"
  #      <- "QUIT\r\n"
  #      -> "221 2.0.0 closing connection c77sm415106lfb.41 - gsmtp\r\n"

  #
  # #initialize Arguments:
  #   email: (String)
  #   password: (String)
  #
  # #let_gods_know_about Arguments:
  #   gods: Array of emails (Strings)
  #   subject: (String)
  #   body: (String)

  attr_reader :email, :password

  def initialize(email, password)
    raise NoCredentialsProvidedError unless password && email
    raise InvalidEmailError unless email =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

    @email = email
    @password = password
  end

  def let_gods_know_about(gods, subject, body)
    gmail = Gmail.new(email, password)

    gmail.deliver do
      to gods
      subject subject
      text_part do
        body body
      end
    end

    gmail.logout
  end

end
