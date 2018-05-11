class OptionNamesController < ApplicationController

  def index
    @option_names = OptionName.all
    json_response(@option_names)
  end

  def show
    @option_name = OptionName.find(params[:id])
    json_response(@option_name)
  end
end
