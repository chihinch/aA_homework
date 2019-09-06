class UserMailer < ApplicationMailer
    default from: '99 Cats <welcome@99cats.com>'

    def welcome_email(user)
        @user = user
        @url = 'http://example.com'
        mail(to: 'chihinch@buffalo.edu', subject: 'Welcome to 99 Cats!')
    end
end
