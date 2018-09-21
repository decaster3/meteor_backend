class StreetsController < ApplicationController

  def index
    @streets = Street.all
    json_response(@streets)
  end

end
