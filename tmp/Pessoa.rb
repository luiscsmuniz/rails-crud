class Pessoa

	@nome = ""

	def initialize(nome)
		@nome = nome
	end
	
	def meu_nome
		@nome
	end
	
end

p1 = Pessoa.new('Luis')
p2 = Pessoa.new('Carlos')

p1.meu_nome
p2.meu_nome