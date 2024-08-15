module Sortable
    extend ActiveSupport::Concern

    module ClassMethods
        # sorts a collection of this model
        # sort_options => hash of sorted columns, with each key matching a column and each value matching a sorting direction (:asc or :desc). The key can also match a sort method defined on the model, such as :user for a model that defines method sort_by_user; these methods take priority over column sorts
        def sort(sort_params = {}, collection = nil)
            results = collection.is_a?(ActiveRecord::Relation) ? collection : self.where(nil)

            if sort_params.present?
                sort_params.each do |key, value|
                    # match key for some pattern like last_played_by_user(1), grouping together the function handle away from any parameters appended to it
                    match = key.match(/([\w_]+)(\(([^)]+)\))?/)

                    # only apply the sort if the sort_option value is a valid order_by keyword and validate sort pattern
                    if [:asc, :desc].include?(value.downcase.to_sym) && match.present?

                        # check for sort_by_#{key} method, use that if found
                        #! use only the some_sort_option part of the sort key, as they constitute the function signature that respond_to? checks for
                        if self.respond_to? "sort_by_#{match[1]}"
                            # check for method parameters embedded in the sort option
                            if match[3]
                                #! for now, only single parameter method needed for sort
                                results = self.public_send("sort_by_#{match[1]}", match[3], value)
                            else
                                results = results.public_send("sort_by_#{match[1]}", value)
                            end
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
