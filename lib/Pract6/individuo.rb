class Individuo

	attr_reader :nombre, :peso, :talla, :edad, :sexo, :cir_cintura, :cir_cadera

	def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera)
		@nombre = nombre
		@peso = peso
                @talla = talla
                @edad = edad
                @sexo = sexo
                @cir_cintura = cir_cintura
                @cir_cadera = cir_cadera
	end
end
