require 'open-uri'

class FlatsController < ApplicationController
  FLATS_URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json".freeze
  before_action :set_flats

  def show
    @flat = @flats.find { |flat| flat["id"] == params[:id].to_i  }
  end

  def index
  end

  private

  def set_flats
    response_serialized = open(FLATS_URL).read
    # json hash
    @flats = JSON.parse(response_serialized)
  end
end
