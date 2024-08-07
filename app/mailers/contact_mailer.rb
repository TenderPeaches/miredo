class ContactMailer < ApplicationMailer
    default from: "contact@miredo.ca"

    def inquiry(params)
        @return_address = params[:return_address]
        @subject = params[:subject]
        @body = params[:body]

        mail(to: "admin@miredo.ca", subject: @subject)
    end
end
