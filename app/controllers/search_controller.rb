class SearchController < ApplicationController

def lokals
  @query = @params["query"]
  @lokals = Lokal.search(@query)
end

end
