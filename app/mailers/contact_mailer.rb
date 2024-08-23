class ContactMailer < ApplicationMailer
    default from: Rails.config.inquiries

    def inquiry(params)
        @return_address = params[:return_address]
        @subject = params[:subject]
        @body = params[:body]

        mail(to: Rails.config.admin_email, subject: @subject)
    end
end
