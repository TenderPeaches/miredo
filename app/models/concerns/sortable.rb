module Sortable
    extend ActiveSupport::Concern

    module ClassMethods
        # sorts a collection of this model
        # sort_options => hash of sorted columns, with each key matching a column and each value matching a sorting direction (:asc or :desc). The key can also match a sort method defined on the model, such as :user for a model that defines method sort_by_user; these methods take priority over column sorts
        def sort(sort_params = {}, collection = nil)
            results = collection.is_a?(ActiveRecord::Relation) ? collection : self.where(nil)

            if sort_params.present?
                sort_params.each do |key, value|
                    debugger
                    # only apply the sort if the sort_option value is a valid order_by keyword
                    if [:asc, :desc].include? value.downcase.to_sym
                        # check for sort_by_#{key} method, use that if found
                          if self.respond_to? "sort_by_#{key}"
                            results = results.public_send("sort_by_#{key}", value)
                        # if method not found, try and sort by column; column_names returns an array of string so make sure that key is a string too
                        elsif self.column_names.include? key.to_s
                            results = results.order(key => value)
                        end
                    end
                end
            end

            results
        end
    end
end
