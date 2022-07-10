class WelcomeController < ApplicationController
  def index
  end

  def hello_world_json()
    render(json: { message: 'Hello World' })
  end
end
