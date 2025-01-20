# contact us page
class InquiriesController < ApplicationController
    def create
        ContactMailer.with(return_address: params[:email], subject: params[:subject], body: params[:body]).inquiry.deliver_now

        flash.notice = t("flashes.inquiry_sent")
        redirect_to :root_path
    end
end
