namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
  	if Rails.env.development?
  		show_spinner('Drop database...') {%x(rails db:drop)}
  		show_spinner('Create database...') {%x(rails db:create)}
  		show_spinner('Migrate database') {%x(rails db:migrate)}
  		puts %x(rails dev:add_mining_types)
      puts %x(rails dev:add_coins)

  	else
  		puts "Não é possível executar essa TASK fora do ambiente de desenvolvimento"
  	end
  end

  desc "Cadastra Moedas"
  task add_coins: :environment do
    show_spinner('Inserindo Registros - Moedas...') do

      coins = 
        [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png',
            mining_type: MiningType.find_by(acronym: "PoW")
          },
          {
            description: "Ethereum",
            acronym: "ETH",
            url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png',
            mining_type: MiningType.all.sample
          },

          {
            description: "Dash",
            acronym: "DASH",
            url_image: 'https://banner2.kisspng.com/20180402/xrq/kisspng-dash-bitcoin-litecoin-cryptocurrency-ethereum-dash-5ac20b52903587.5621313815226663225907.jpg',
            mining_type: MiningType.all.sample
          }
        ]

      coins.each do |coin|
        Coin.find_or_create_by(coin);
      end
    end
  end

  desc "Cadastra Tipos de Mineração "
  task add_mining_types: :environment do
    show_spinner('Inserindo Registros - Tipos de Mineração...') do

      mining_types = 
        [
          {
            description: "Proof of Work",
            acronym: "PoW",
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
        MiningType.find_or_create_by(mining_type);
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end='100% - Concluído')
  	spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
	spinner.auto_spin
	yield
	spinner.success("(#{msg_end})")
  end


end
