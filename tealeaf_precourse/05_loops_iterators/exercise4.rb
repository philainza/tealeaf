def countdown(num)
	if num <= 0
		puts num
	else
		puts num
		countdown(num - 1)
	end
end

countdown(10)
countdown(5)
countdown(-5)