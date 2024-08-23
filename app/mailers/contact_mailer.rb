class ContactMailer < ApplicationMailer
    default from: Rails.configuration.inquiries_email

    def inquiry(params)
        @return_address = params[:return_address]
        @subject = params[:subject]
        @body = params[:body]

        mail(to: Rails.configuration.admin_email, subject: @subject)
    end
end
