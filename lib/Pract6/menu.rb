

class Menu

	attr_accessor :alimentos

	def initialize

		@alimentos = []
	end

	def add(alimento)
		@alimentos << alimento
	end

end
