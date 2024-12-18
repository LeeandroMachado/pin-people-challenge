class DryValidationError < StandardError
  attr_reader :status, :errors

  def initialize(message = "invalid request body", status = 422, errors)
    @status = status
    @errors = errors

    super(message)
  end
end
