module ApplicationHelper


	def app_title
		"Cripto Wallet - Ruby"
	end

	def env_rails
		if Rails.env.development?
			"Desenvolvimento"
		elsif Rails.env.production?
			"Produção"
		else
			"Teste"
		end
	end

	def site_name
		"Cripto Wallet"
	end
end
