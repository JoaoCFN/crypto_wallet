class WelcomeController < ApplicationController
  def index
    @nome = params[:nome]
  end

  def hello_world_json()
    render(json: { message: 'Hello World' })
  end
end
