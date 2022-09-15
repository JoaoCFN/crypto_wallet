class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Jackson Pires"
    @nome = params[:nome]
  end
end
