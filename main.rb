require 'date'

def howmanyyears (bd, d)
    # Difference in years, less one if you have not had a birthday this year.
    a = d.year - bd.year
    a = a - 1 if (
    	bd.month >  d.month or
    	(bd.month >= d.month and bd.day > d.day)
    	)
    a
end

def happybday(date,proc)
	today = DateTime.now
	birthdays = howmanyyears(date, today)
	birthdays.times {proc.call(date)}
end

birthday = Proc.new{|a1| puts "#1.) Happy Birthday #{a1}"}
birthdate = Date.new(1992, 06, 16)
happybday(birthdate,birthday)

def happybday2
	today = DateTime.now
	future = Date.new(2020)
	birthdays = howmanyyears(today, future)
	count = 0
	(birthdays+1).times {
		count+=1
		yield Date.new(1992, 06, 16), today.year+count
	}

end

birthday2 = lambda { |birthday,year|
	if year <2020
		puts "#2.) Happy Birthday. You are now #{howmanyyears(birthday,Date.new(year))} years old. The year is #{year}"
	else
		puts "2020"
	end
}
happybday2(&birthday2)
