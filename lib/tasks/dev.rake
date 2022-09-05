namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    if(Rails.env.development?)
      show_spinner("Deleting database...") do
        %x(rails db:drop)
      end

      show_spinner("Creating database...") do
        %x(rails db:create)
      end

      show_spinner("Making migrations...") do
        %x(rails db:migrate)
      end

      show_spinner("Running seeds...") do
        %x(rails db:seed)
      end
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  private
    def show_spinner(start_message, end_message = "Successful")
      spinner = TTY::Spinner.new("[:spinner] #{start_message}")
      spinner.auto_spin
      yield
      spinner.success("(#{end_message})")
    end
end
