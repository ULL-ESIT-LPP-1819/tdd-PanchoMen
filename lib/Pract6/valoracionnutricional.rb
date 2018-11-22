require './lib/Pract6/individuo.rb'

class ValoracionNutricional

	attr_reader :paciente, :imc, :porcentaje_grasa, :rcc

	def initialize(paciente)
		@paciente = paciente
		@imc = 0.0
		@porcentaje_grasa = 0.0
		@rcc = 0.0
	end	


	def clas_imc(imc)
		#"IMC: 15.43 (Bajo Peso)"
		if imc < 18.5
			return "Bajo peso"
		elsif imc >= 18.5 && imc <= 24.9
			return "Adecuado"
		elsif imc > 24.9 && imc <= 29.9
			return "Sobrepeso"
		elsif imc > 29.9 && imc <= 39.9
			return "Obesidad grado 1"
		elsif imc > 39.9
			return "Obesidad grado 2"
		end
	end

	def cal_imc()
		@imc = (@paciente.peso/(@paciente.talla * @paciente.talla)).round(2)
	end

	def cal_porcentaje_grasa()
		if @imc == 0.0
			cal_imc()
		end
		@porcentaje_grasa = ((1.2 * @imc) + (0.23 * @paciente.edad) - (10.8 * @paciente.sexo) - 5.4).round(2)
	end
end
