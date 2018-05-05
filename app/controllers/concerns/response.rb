module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  # Parse JSON response to ruby hash
  def json_parse(request)
    JSON.parse(request)
  end

end