require "./lib/Pract6/etiqueta.rb"

RSpec.describe Etiqueta do

	before :each do
		#@etiqueta1 = Pract6.new()
		@etiqueta1 = Etiqueta.new("Galletas", 0, 0, 0, 0, 0, 0, 0)
  	end

	describe "# Pruebas de existencias de los atributos #" do
		it "Comprobar que existe un nombre de etiqueta" do
			expect(@etiqueta1.nombre).not_to be nil
		end

		it "Comprobar que existe la cantidad de grasas" do
                	expect(@etiqueta1.grasas).not_to be nil
        	end

		it "Comprobar que existe la cantidad de grasas saturadas" do
                	expect(@etiqueta1.grasas_saturadas).not_to be nil
        	end

		it "Comprobar que existe la cantidad de hidratos de carbono" do
                	expect(@etiqueta1.hidratos_carbono).not_to be nil
        	end

		it "Comprobar que existe la cantidad de azúcares" do
			expect(@etiqueta1.azucares).not_to be nil
        	end

		it "Comprobar que existe la cantidad de proteínas" do
			expect(@etiqueta1.proteinas).not_to be nil
        	end

		it "Comprobar que existe la cantidad de sal" do
			expect(@etiqueta1.sal).not_to be nil
        	end
	end
end
