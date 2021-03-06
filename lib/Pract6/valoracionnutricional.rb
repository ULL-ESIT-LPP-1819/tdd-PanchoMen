require './lib/Pract6/individuo.rb'

# @author Francisco Javier Mendoza Alvarez

class ValoracionNutricional
	
	include Comparable

	attr_reader :paciente, :imc, :porcentaje_grasa, :rcc
	
	# Metodo para la inicializacion de los objetos

	def initialize(paciente)
		@paciente = paciente
		@imc = 0.0
		@porcentaje_grasa = 0.0
		@rcc = 0.0
		calcular()
	end	

	# Metodo usado por el modulo Comparable
	
	def <=>(other)
           @imc <=> other.imc
         end

	# Clasifica el Indice de masa corporal segun su valor
	#
	# Los posibles valores son : Bajo peso, Adecuado, Sobrepeso, Obesidad grado 1, Obesidad grado 2
	#
	#  == Returns:
	# Devuelve un string segun la clasificacion correspondiente

	def clas_imc()
		if @imc < 18.5
			return "Bajo peso"
		elsif @imc >= 18.5 && @imc <= 24.9
			return "Adecuado"
		elsif @imc > 24.9 && @imc <= 29.9
			return "Sobrepeso"
		elsif @imc > 29.9 && @imc <= 34.9
			return "Obesidad grado 1"
		elsif @imc > 35.0
			return "Obesidad grado 2"
		end
	end

	# Calcula el indice de masa corporal
	#
	#  == Returns:
	# Devuelve el valor del IMC

	def cal_imc()
		@imc = (@paciente.peso/(@paciente.talla * @paciente.talla)).round(2)
	end

	# Calcula el porcentaje de grasa corporal
	#
	#  == Returns:
        # Devuelve el porcentaje de grasa corporal

	def cal_porcentaje_grasa()
		if @imc == 0.0
			cal_imc()
		end
		@porcentaje_grasa = ((1.2 * @imc) + (0.23 * @paciente.edad) - (10.8 * @paciente.sexo) - 5.4).round(2)
	end

	# Calcula el RCC
        #
        #  == Returns:
        # Devuelve el RCC


	def cal_rcc()
		@rcc = (@paciente.cir_cintura / @paciente.cir_cadera).round(2)
	end

	# Realiza el calculo de todos los indicadores de valoración nutricional

	def calcular()
		cal_imc()
		cal_porcentaje_grasa()
		cal_rcc()
	end

	# Convierte el Objeto en String
        #
        # == Returns:
        # Un String que representa al objeto
	
	def to_s()
		string = "IMC: #{@imc}\n"
		string += "Porcentaje de grasa: #{@porcentaje_grasa}\n"
		string += "RCC: #{@rcc}"
		return string
	end
end
