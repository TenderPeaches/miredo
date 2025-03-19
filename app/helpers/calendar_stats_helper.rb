module CalendarStatsHelper
	def calendar_current_period_string(calendar_stats)
		# Jan 1 - 7 or Feb 26 - Mar 03
		"#{calendar_stats.period.start_date.strftime("%b %d")} - #{calendar_stats.period.end_date.strftime("#{calendar_stats.period.end_date.month != calendar_stats.period.start_date.month ? "%b" : ""} %d")}"
	end

	# array of weekday names, starting from monday
	def weekdays_starting_monday
		weekdays = Date::DAYNAMES.dup
		weekdays.push(weekdays.shift)
	end
end
