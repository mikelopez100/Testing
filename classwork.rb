    require 'net/http'
    require 'json'
    require 'openssl'
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    
    def btcValue()
        url = 'https://api.coinbase.com/v2/prices/spot?currency=USD'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        btcValue = JSON.parse(response)["data"]["amount"].to_f
        return btcValue
    end


    def usd2btc()
    puts "Enter how much money you have to see how many BTC you can buy."
    uusd = gets.chomp.to_f
    value = btcValue
    value = uusd/value
    puts "BTC: #{value}"
    end
    
    
    def btc2usd()
    puts "Enter how many bitcoins you have."
    ubtc = gets.chomp.to_f
    value = btcValue
    value = value * ubtc
    puts "USD: #{value}"
    end
    
    puts "Welcome to BTC Converter!"
    puts "1) USD to BTC Converter!"
    puts "2) BTC to USD Converter!"
    puts "3) Quit!"
    
    puts "Which option would you like to select?"
    user = gets.chomp.to_i
    
    while user!=3
    if user == 1
      usd2btc()
    end
    if user == 2
      btc2usd()
    end
    puts "1) USD to BTC Converter!"
    puts "2) BTC to USD Converter!"
    puts "3) Quit!"
    puts "Which option would you like to select?"
    user = gets.chomp.to_i
    end