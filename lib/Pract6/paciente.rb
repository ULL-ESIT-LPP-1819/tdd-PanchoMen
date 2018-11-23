require './lib/Pract6/individuo.rb'
require './lib/Pract6/valoracionnutricional.rb'


class Paciente < Individuo
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
end
