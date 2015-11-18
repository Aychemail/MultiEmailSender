## Multiple receivers email sender via gmail.

#### How to use?
* Create hermes instance: `hermes = HermesTan.new(email, password)`
* Send emails: `hermes.let_gods_know_about(receivers, subject, body)`

#### Tests
* You need to provide valid username and password to successfully login into gmail account: `EMAIL=<your email> PASWD=<your password> rspec spec`

