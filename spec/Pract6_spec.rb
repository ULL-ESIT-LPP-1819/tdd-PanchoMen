require "./lib/Pract6/etiqueta.rb"

RSpec.describe Etiqueta do

	before :each do
		#@etiqueta1 = Pract6.new()
		@etiqueta1 = Etiqueta.new("Galletas", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
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

	describe "# Pruebas de existencia de los metodos para acceder a los atributos #" do
		it "Comprobar que un método para obtener el nombre" do
			expect(@etiqueta1.nombre).to eq("Galletas")
		end

		it "Comprobar que exite un método para obtener las grasas" do
			expect(@etiqueta1.grasas).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener las grasas saturadas" do
			expect(@etiqueta1.grasas_saturadas).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener los hidratos de carbono" do
                        expect(@etiqueta1.hidratos_carbono).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener los azucares" do
                        expect(@etiqueta1.azucares).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener las proteinas" do
                        expect(@etiqueta1.proteinas).to eq(0.0)
                end

		it "Comprobar que existe un método para obtener la sal" do
                        expect(@etiqueta1.sal).to eq(0.0)
                end
	end

	describe "# Prueba de salida por pantalla" do
		expect(@etiqueta.to_s).to eq("Nombre\tGrasas\tGrasas Saturadas\tHidratos de Carbono\tAzucares\tProteinas\tSales\nGalletas\t0.0\t0.0\t0.0\t0.0\t0.0\t0.0")
	end
end
