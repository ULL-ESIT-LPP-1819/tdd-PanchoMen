require './lib/Pract6/individuo.rb'
require './lib/Pract6/valoracionnutricional.rb'


class Paciente < Individuo
	attr_reader :valoracion_nutricional

	def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, factor_act_fis)
		super(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera)
		@valoracion_nutricional = ValoracionNutricional.new(self)
		@valoracion_nutricional.calcular()
		@factor_act_fis = factor_act_fis
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

	def efecto_termogeno
		gasto_energetico_basal * 0.1
	end

	def gasto_actividad_fisica(factor)
                gasto_energetico_basal * factor
        end

	def gasto_energetico_total
		gasto_energetico_basal + efecto_termogeno + gasto_actividad_fisica(@factor_act_fis)
	end

	def menu_dietectico?(menu)
		valor_energetico = menu.map{|i| i.get_valor_energetico_Kcal}.reduce(:+).round(1)
		#puts "Gasto energetico entre: #{gasto_energetico_total * 0.9} - #{gasto_energetico_total * 1.1}, valor obtenido: #{valor_energetico}"
		((gasto_energetico_total * 0.9)...(gasto_energetico_total * 1.1)).include? valor_energetico
	end
end
