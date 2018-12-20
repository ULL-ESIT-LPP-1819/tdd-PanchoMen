

class Menu

	include Comparable
	include Enumerable

	attr_accessor :alimentos

	def initialize

		@alimentos = []
	end

	def add(alimento)
		@alimentos << alimento
	end

	def <=>(other)
		valor_energetico <=> other.valor_energetico
	end

	def valor_energetico
		@alimentos.map{|i| i.get_valor_energetico_Kcal}.reduce(:+).round(1)
	end

	def each
		yield @alimentos.each
	end

	def to_s
		string = "Valor energetico: #{valor_energetico}, Elementos: "
		string += @alimentos.map{|x| x.nombre}.to_s
	end

end
