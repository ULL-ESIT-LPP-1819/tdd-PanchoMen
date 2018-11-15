# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class Lista
    attr_accessor :inicio, :final, :size
	
    def initialize()
        @inicio= Node.new(nil,nil,nil)
        @final= Node.new(nil,nil,nil)
        @size = 0
    end

    def empty()
        if(@inicio.value == nil)
            return true
        else
            return false
        end
    end
end
