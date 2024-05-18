* Filtering: 
    > Using a GET request to Songs#Index, with QSA parameters for filters
        # When defining scopes for filter, ambiguous parameter for models. For instance, filter_by_user(user), should the filter only accept an instance of User or an integer (ID)? Or should it accept both and test for class?
    > For now, force integers. Too much bloat to add type-verification in the scope. Should probably be a custom type of scope defined in ActiveRecord or something.
        - on the downside, this is less flexible for advanced filtering. For instance, if we want to filter on a user whose name contains a given string, we'd need to filter users first, instead of just filtering the filtered model directly.
            > For now, this is deemed an acceptable price to pay
            > Eventually, filters will need more support from the ActiveRecord class
        - little fuckery, is that unless we want to use filter_by_user_id, there's a disconnect between the filter_option parameter name (which must be user to be matched with filter_by_user) and the value that must be passed (which must be user.id, instead of user)
            > To prevent this, have the Filterable interface look for the non-id filter version if it doesn't find "filter_by_user_id", for instance

* Sorting: 
    ? Add to filtering? Will there be any instances of models that can be filtered but not sorted?
        > Presumably, no. Sorting is a by-product of large datasets. Filtering is a by-product of large datasets. A small dataset which doesn't need sorting presumably doesn't need filtering either. Simple sorting can be done at the controller level anyway.
    * Include with filtering as a two-for-one, until a convenient solution is found
    * Alternatively, include an optional "collection/activerelation" parameter in functions like filter
        > Let's do this, makes for heavier functions but more flexible and doesn't squish filtering with sorting   
    ? How to switch the sorting orders, for instance when clicking "sort by capo", first click should be ascending, then descending
        # Use turbo_stream responses to adjust the path of the sort buttons
        # Store sorting options in the session and have the controller deal with it
        > I would favor turbo_stream as a temporary measure, but eventually stuff like filter/sort options might be better served being stored in the user's session in order to keep their preferences from page to page 
    ? Sorting should be applied absolutely => excludes more specific sort like "sort by artist then ID". This is fine, becau