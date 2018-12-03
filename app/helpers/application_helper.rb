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

	def locale
		if I18n.locale == :en
			'Inglês'
		else
			'Português'
		end
	end

	def site_name
		"Cripto Wallet"
	end
end
