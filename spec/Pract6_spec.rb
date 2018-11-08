RSpec.describe Pract6 do

	#before :each do
    	#	@etiqueta1 = Pract6.new()
  	#end

	describe "# Pruebas de existencias de los atributos #" do
		it "Comprobar que existe un nombre de etiqueta" do
			expect(subject).to respond_to(:nombre)
		end

		it "Comprobar que existe la cantidad de grasas" do
                	expect(Pract6.attributes).to include(:grasas)
        	end

		it "Comprobar que existe la cantidad de grasas saturadas" do
                	expect(Pract6.attributes).to include(:grasas_saturadas)
        	end

		it "Comprobar que existe la cantidad de hidratos de carbono" do
                	expect(Pract6.attributes).to include(:hidratos_de_carbono)
        	end

		it "Comprobar que existe la cantidad de azúcares" do
                	expect(Pract6.attributes).to include(:azucares)
        	end

		it "Comprobar que existe la cantidad de proteínas" do
                	expect(Pract6.attributes).to include(:proteinas)
        	end

		it "Comprobar que existe la cantidad de sal" do
                	expect(Pract6.attr_writer).to include(:sal)
        	end
	end
end
