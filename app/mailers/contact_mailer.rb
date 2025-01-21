class ContactMailer < ApplicationMailer
    default from: Rails.configuration.inquiries_email

    def inquiry
        @return_address = params[:return_address]
        @subject = params[:subject]
        @body = params[:body]

        mail(to: Rails.configuration.inquiries_email, subject: @subject)
    end
end
