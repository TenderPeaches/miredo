class String
    # for now only works with :symbols.to_s, because haven't had any other use case
    # todo find proper, more general function with regexes and stuff
    def kebabcase
        self.downcase.dasherize
    end

    # select inputs don't automatically word-wrap or truncate strings so their width can get out of control, use this method to set the <option> labels when that might be an issue
    def truncate_with_ellipsis(cutoff_point = 20, ellipsis = "(...)")

        # if string length is below the cutoff point
        if self.size < cutoff_point
            # use the string as is
            self
        # if, starting from the cutoff point, there's less than twice the length of the ellipsis remaining to the string
        elsif self.size < cutoff_point + (ellipsis.size * 2)
            # replace the end of the string with an ellipsis
            "#{self[..cutoff_point]} #{ellipsis} "
        # otherwise, the string is presumably quite long
        else
            # adjust the cutoff, since the end result will be quite long otherwise
            cutoff_point = cutoff_point - ellipsis.size
            # slice the ellipsis between the beginning and end of the string
            "#{self[..cutoff_point]} #{ellipsis} #{self[(cutoff_point * -1)..]}"
        end
    end
end
