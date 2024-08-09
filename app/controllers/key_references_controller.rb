class KeyReferencesController < ApplicationController
    def index
        @scales = Scale.for_references
    end
end
