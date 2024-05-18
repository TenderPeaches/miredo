module Filterable
    extend ActiveSupport::Concern

    module ClassMethods
        # filters this model according to a set of params
        # filter_params => hash with each key matching a model filter (ie if model has filter_by_user defined, filter_params may include :user => 1, filtering for all models with an attribute of user_id == 1)
        # collection => optional collection of [self] to filter, rather than start from all instances of the model, must be an ActiveRecord::Relation otherwise Model.all is used
        def filter(filter_params = {}, collection = nil)

            # use the collection param as a base sample if collection is an ActiveRecord::Relation, otherwise, use all of the model's instances as a base sample
            results = collection.is_a?(ActiveRecord::Relation) ? collection : self.where(nil)

            if filter_params.present?
                # for each filter
                filter_params.each do |key, value|
                    # ensure there is a value to filter against
                    if value.present?
                        # test the existence of the filter method in order to ignore filter_options which don't have a matching filter
                          if results.respond_to?("filter_by_#{key}", value)
                            # default filter match
                            results = results.public_send("filter_by_#{key}", value)
                        # since filters work with GET parameters for now, it's a lot easier to just pass IDs rather than full objects so anytime there's a filter_by_some_model, the actual filter value will be an integer matching the ID of the filtered model. This means the "filter_by_#{key}" will not match, as the filter option key will be "model_id" rather than "model"
                        # to avoid throwing errors, just test for the filter_by_model method by chopping off the last 3 characters, which remove the _id suffix from the filter option key
                        #! this solution is a bit more general than necessary but unless any security issues come up, it's considered sufficient
                        elsif results.respond_to?("filter_by_#{key[-3..]}")
                            results = results.public_send("filter_by_#{key[-3..]}", value)
                        end
                    end
                end
            end

            results
        end
    end
end
