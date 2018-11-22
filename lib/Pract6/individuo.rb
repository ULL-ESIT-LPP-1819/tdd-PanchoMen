class Individuo

	attr_reader :nombre, :peso, :talla, :edad, :sexo, :cir_cintura, :cir_cadera

	def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera)
		@nombre = nombre
		@peso = peso
                @talla = talla
                @edad = edad
                @sexo = sexo
                @cir_cintura = media(cir_cintura)
                @cir_cadera = media(cir_cadera)
	end

	def get_sexo
		if @sexo == 1
                        sexo = 'hombre'
                elsif @sexo == 0
                        sexo = 'mujer'
                end
	end

	def media(array)
                var = 0
                count = 0
                while var < array.length
                        count += array[var]
                        var += 1
                end
                return (count/array.length)
        end

	def to_s
		string = "\t#{@nombre}\n"
		string += "peso: #{@peso}\n"
		string += "talla: #{@talla}\n"
		string += "edad: #{@edad}\n"
		string += "sexo: #{get_sexo}\n"
		string += "media circunferencia de cintura: #{@cir_cintura}\n"
		string += "media circunferencia de cadera: #{@cir_cadera}"
		return string
        end
end
