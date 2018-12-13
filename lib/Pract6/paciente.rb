require './lib/Pract6/individuo.rb'
require './lib/Pract6/valoracionnutricional.rb'


class Paciente < Individuo
	attr_reader :valoracion_nutricional

	def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera)
		super(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera)
		@valoracion_nutricional = ValoracionNutricional.new(self)
		@valoracion_nutricional.calcular()
	end

	def imc
		@valoracion_nutricional.imc
	end

	def porcentaje_grasa
		@valoracion_nutricional.porcentaje_grasa
	end

	def rcc
		@valoracion_nutricional.rcc
	end

	def to_s
		string = super.to_s
		string += "\n"
		string += "\tValoracion Nutricional:\n"
		string += @valoracion_nutricional.to_s
		return string
	end

	def talla_cm
		(@talla * 100).to_i
	end

	def peso_teorico_ideal
		((talla_cm - 150) * 0.75 + 50).round(1)
	end

	def gasto_energetico_basal
		if @sexo == 1 #Hombres
			(10 * @peso + 6.25 * talla_cm - 5 * @edad + 5)
			#.round(1)
		else  #Mujeres	
			(10 * @peso + 6.25 * talla_cm - 5 * @edad - 161)
			#.round(1)
		end
	end
end
