module ApplicationHelper


	def app_title
		"Cripto Wallet - Ruby"
	end

	def env_rails
		if Rails.env.development?
			"development"
		elsif Rails.env.production?
			"production"
		else
			"test"
		end
	end

	def site_name
		"Cripto Wallet - Ruby"
	end
end
