module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_parse(request)
    JSON.parse(request)
  end

end