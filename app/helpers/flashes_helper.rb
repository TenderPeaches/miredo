module FlashesHelper
    def flash_model_errors(model)
        render "application/flash_model_errors", model: model
    end
end
