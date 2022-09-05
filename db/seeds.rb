# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  }
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end