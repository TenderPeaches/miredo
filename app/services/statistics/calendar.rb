module Statistics
	class Calendar
		attr_reader :period_type, :period, :stats
		def initialize(user, period_type = PeriodType::MONTHLY, period = nil)
			@user = user
			@period_type = period_type
			@period = period || default_period
		end

		# generate the day-by-day stats for the given period
		def generate_stats
			@stats = []

			(@period.start_date..@period.end_date).each do |date|
				@stats << generate_day_stats(date)
			end

			Result.new(@period_type, @period, @stats)
		end

		class PeriodType
			WEEKLY = :weekly
			MONTHLY = :monthly
			YEARLY = :yearly
		end

		class Period
			attr_reader :start_date, :end_date
			def initialize(start_date, end_date)
				@start_date = start_date
				@end_date = end_date
			end
		end

		class DayStats
			attr_reader :plays, :adds
			def initialize(plays, adds)
				@plays = plays
				@adds = adds
			end
		end

		private

		class Result
			attr_reader :period_type, :period, :stats
			def initialize(period_type, period, stats)
				@period_type = period_type
				@period = period
				@stats = stats
			end
		end
		# generate the stats for a single day
		def generate_day_stats(date)
			# songs played that day by the user
			play_count = SongPlay.where(user: @user, played_at: date.beginning_of_day..date.end_of_day).count

			# songs added that day
			add_count = Song.where(submitter: @user, created_at: date.beginning_of_day..date.end_of_day).count

			DayStats.new(play_count, add_count)
		end

		def default_period
			# given the current date
			current_date = Date.current

			case @period_type
			when PeriodType::WEEKLY
				# start to end of the current week
				Period.new(current_date.beginning_of_week, current_date.end_of_week)
			when PeriodType::MONTHLY
				# start to end of the current month
				Period.new(current_date.beginning_of_month, current_date.end_of_month)
			when PeriodType::YEARLY
				# start to end of the current year
				Period.new(current_date.beginning_of_year, current_date.end_of_year)
			end
		end
	end
end
