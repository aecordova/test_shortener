class UrlsController < ApplicationController
  protect_from_forgery :except => :create 

  def create
    if shortened_url = Url.create(url_params)
      render json: { short_url: shortened_url.short_url }, status: :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
