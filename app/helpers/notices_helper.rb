module NoticesHelper

    # notice element
    def notice(options = {}, &block)
        tag.div class: "notice#{options[:class].blank? ? "" : " #{options[:class]}"}" do
            yield block
        end
    end

    def warning_notice(&block)
        notice(class: "warning", &block)
    end
end
