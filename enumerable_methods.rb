module Enumerable
	def my_each
		i = 0
		self.size.times do
			yield self[i]
			i += 1
		end
		return self
	end
	def my_each_with_index
		i = 0
		self.size.times do
			yield self[i], i
			i += 1
		end
		return self
	end
	def my_select
		array = []
		self.my_each do |i|
			array << i if yield i
		end
		return array
	end
	def my_all?
		self.my_each do |i|
			return false unless yield i
		end
		return true
	end
	def my_any?
		self.my_each do |i|
			return true if yield i
		end
		return false
	end	
	def my_none?
		self.my_each do |i|
			return false if yield i
		end
		return true
	end
	def my_count(object = nil)
		if block_given?
			k = 0
			self.my_each do |i|
				k += 1 if yield i
			end
			return k		
		elsif object.nil?
			return self.length
		else
			j = 0
			self.my_each do |i|
				j += 1 if i == object
			end
			return j
		end
	end
	def my_map(&block)
		array = []
		if block_given?
			self.my_each do |i|
				value = block.call(i)
				array << value
			end
			array
		else
			self
		end
	end
	def my_inject(object = nil)
		value = self[0]
		value = object unless object.nil?
		self.my_each do |i|
			value = yield value, i
		end
		value
	end
end

def multiply_els(array)
	array.my_inject(1) do |total, i|
		total *= i
	end
end		