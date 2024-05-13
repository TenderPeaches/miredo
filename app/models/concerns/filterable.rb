module Filterable
    extend ActiveSupport::Concern

    module ClassMethods
        def filter(filter_params)
            debugger
            # start with no filters
            results = self.where(nil)

            # for each filter
            filter_params.each do |key, value|
                # filter the results
                results = results.public_send("filter_by_#{key}", value) if value.present?
            end
        end
    end
end
