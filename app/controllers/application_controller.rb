class ApplicationController < ActionController::API
  rescue_from DryValidationError, with: :handle_dry_validation_error

  private

  def handle_dry_validation_error(error)
    render json: { message: "invalid request body", errors: error.errors }, status: :unprocessable_entity
  end
end
