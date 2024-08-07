class InquiriesController < ApplicationController
    def create
        ContactMailer.with(return_address: params[:email], subject: params[:subject], body: params[:body]).inquiry.delivery_now
    end
end
