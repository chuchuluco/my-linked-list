class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @head ||= new_node
    if !@tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    next_node = @head
    size = 0
    until next_node.nil?
      if next_node == @head
        next_node = @head.next_node
        size += 1
      else 
        next_node = next_node.next_node
        size += 1
      end
    end
    size
  end

  def at(index)
    return @head.value if index == 0
    place = 1
    next_node = @head.next_node
    until place == index
       next_node = next_node.next_node
      place +=1
    end
    return next_node.value
  end

  def pop 
    return @head = nil if self.size == 1
    current_node = @head
      until current_node.next_node == @tail
        current_node = current_node.next_node
      end
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      if current_node.value == value
        return true
      end
      current_node = current_node.next_node
    end
    false
  end

end

class Node 
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(45)
list.append(26)
list.append(3555)
list.append(4)

puts list.size
puts list.at(0)
list.pop
puts list.size
