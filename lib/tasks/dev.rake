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

      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Inserting Coins"
  task add_coins: :environment do
    show_spinner("Inserting coins...") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://seeklogo.com/images/B/bitcoin-logo-DDAEEA68FA-seeklogo.com.png"
        },
        {
          description: "Ethereum",
          acronym: "ETC",
          url_image: "https://marcas-logos.net/wp-content/uploads/2020/03/ETHEREUM-LOGO.png"
        },
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://seeklogo.com/images/D/dash-logo-4A14989CF5-seeklogo.com.png"
        },
        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png"
        },
        {
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png"
        }
      ]
  
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Inserting Mining Types"
  task add_mining_types: :environment do
    show_spinner("Inserting mining types...") do
      mining_types = [
        {
          description: "Proof of Work",
          acronym: "PoW"
        },
        {
          description: "Proof of Stake",
          acronym: "PoS"
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC"
        }
      ]
  
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
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
