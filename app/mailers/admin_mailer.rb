class AdminMailer < ApplicationMailer
    default from: Rails.configuration.admin_email

    def test_email
        RestClient.post "https://api:2b91eb47-ad0e8aeb@api.mailgun.net/v3/sandboxa796756b0b954c1b9ff4d8299fc54a4d.mailgun.org/messages", :from => "Excited User <mailgun@sandboxa796756b0b954c1b9ff4d8299fc54a4d.mailgun.org>", :to => "bar@example.com, YOU@sandboxa796756b0b954c1b9ff4d8299fc54a4d.mailgun.org", :subject => "Hello", :text => "Testing some Mailgun awesomeness!"
    end
end
