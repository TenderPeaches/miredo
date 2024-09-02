class ApplicationMailer < ActionMailer::Base
    default from: Rails.application.config.no_reply_email
    layout "mailer"
end
