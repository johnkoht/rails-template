class ApplicationController < ActionController::Base
  include JsonResponseHelper

  def index
  end

  # We use this for monitoring site health with Docker, Honeybadger, etc
  def health
    response.headers['Cache-Control'] = 'private, no-cache'
    render nothing: true, status: 200
  end
end
