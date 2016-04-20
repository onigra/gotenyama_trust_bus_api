class ExceptionsApp < Rambulance::ExceptionsApp
  def bad_request
    res = {
      status: "Bad request.",
      code: 400,
      message: "The service received a incomplete request."
    }
    render json: res, status: 400
  end

  def forbidden
    res = {
      status: "Forbidden.",
      code: 403,
      message: "You are not authorized to access this page.",
    }
    render json: res, status: 403
  end

  def not_found
    res = {
      status: "Not Found.",
      code: 404,
      message: "The page you were looking for doesn't exist. You may have mistyped the address or the page may have moved.",
     }
    render json: res, status: 404
  end

  def internal_server_error
    res = {
      status: "Internal Server Error.",
      code: 500,
      message: "We're sorry, but something went wrong."
    }
    render json: res, status: 500
  end

  def unprocessable_entity
    res = {
      status: "Unprocessable Entity.",
      code: 422,
      message: "The change you wanted was rejected."
    }
    render json: res, status: 422
  end
end
