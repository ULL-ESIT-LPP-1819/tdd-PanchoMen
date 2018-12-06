# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class Lista
    
	include Enumerable

	attr_accessor :inicio, :final, :size
	
    def initialize()
        @inicio= Node.new(nil,nil,nil)
        @final= Node.new(nil,nil,nil)
        @size = 0
    end

    def each
         node = @inicio

         while !(node.nil?)
             yield node.value
           node = node.next
         end
      end


    def empty?()
        if(@size == 0)
            true
        else
            false
        end
    end

    def insert(valor)
        nuevo = Node.new(valor,nil,@inicio)
        if (empty?)
          @inicio = Node.new(valor,nil,nil)
          @final = @inicio
          @size = 1
        elsif (@size == 1)
          @inicio = nuevo
          @final.next = @inicio
          @inicio.prev = @final
          @size += 1
        elsif (@size > 1)
          ant_inicio = Node.new(@inicio.value,nuevo,@inicio.prev)
          ant_inicio.prev.next = ant_inicio
          @inicio = nuevo
          @inicio.prev.next = @inicio
          @size += 1
        end
    end

    def shift()
        if(empty?)
           puts "No hay elementos"
        elsif(@size==1)
           aux = Node.new(@inicio.value,nil,nil)
           @size -= 1
           @inicio = Node.new(nil,nil,nil)
           @final = Node.new(nil,nil,nil)
           aux.value
        elsif(@size > 1)
           aux = Node.new(@inicio.value,nil,nil)
	   @size -= 1
           @inicio.prev.next = nil
           @inicio = @inicio.prev
           aux.value
        end
    end

    def pop()
        if(empty?)
           puts "No hay elementos"
        elsif(@size == 1)
           aux = Node.new(@final.value,nil,nil)
           @size-=1
           @inicio = Node.new(nil,nil,nil)
           @final = Node.new(nil,nil,nil)
           aux.value
        elsif(@size > 1)
           aux = Node.new(@final.value,nil,nil)
           @size-=1
	   @final.next.prev = nil
           @final = @final.next
           aux.value
        end
    end
end
