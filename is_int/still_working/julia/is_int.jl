function is_int(s)
	i = firstindex(s)
	l = lastindex(s)
	@goto S0

	@label S0
	if i > l 
		@goto S4
	elseif s[i] == '+' || s[i] == '-'
		i = nextind(s, i)
		@goto S1
	elseif '0' <= s[i] && s[i] <= '9'
		i = nextind(s, i)
		@goto S2
	else
		@goto S4
	end

	@label S1

	@label S2

	@label S3
	return true

	@label S4
	return false
end

tests = [
	 ("", false)
	 (" ", false)
	 ("+", false)
	 ("-", false)
	 ("++", false)
	 ("--", false)
	 ("+0+", false)
	 ("-0-", false)
	 ("+0123456789", true)
	 ("-0123456789", true)
	 ("0123456789", true)
	 ]

for t in tests
    println("$(t[2] == is_int(t[1]) ? "OK" : "NG")\t'$(t[1])'")
end
