# replace the default field_with_error behavior that wraps once around the label and once around the field, instead creating just one wrapper for both the label and the input field
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    tag.div html_tag, class: "field-with-errors"
end
