require 'spec_helper'

describe HermesTan do

  it 'fails to login to fake gmail account' do
    expect { HermesTan.new('test@gmail.com', 'password').let_gods_know_about(['test@i.ua', 'let@gmail.com'], 'test', 'test') }.to raise_error(/Username and Password not accepted/)
  end

  it 'successfully login to gmail account with credentials passed via env variables and sends message' do
    expect(HermesTan.new(ENV['EMAIL'], ENV['PASWD']).let_gods_know_about(['test@i.ua', 'let@gmail.com'], 'test', 'test')).to be_nil
  end

  it 'fails to initialize if no credentials provided' do
    expect { HermesTan.new(nil, nil).let_gods_know_about(['test@i.ua', 'let@gmail.com'], 'test', 'test') }.to raise_error(NoCredentialsProvidedError)
  end

  it 'fails to initialize if provided invalid email' do
    expect { HermesTan.new('sdf', 'nil').let_gods_know_about(['test@i.ua', 'let@gmail.com'], 'test', 'test') }.to raise_error(InvalidEmailError)
  end

end
