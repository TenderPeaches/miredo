class CalendarStatsController < ApplicationController
	def index
		@user = current_user
		@period_type_cycle = params[:type]&.to_sym
		@period_cycle = params[:period]&.to_sym

		cycle_period_type if @period_type_cycle
		cycle_period if @period_cycle
	end

	private

	def cycle_period_type
		current = params[:current].to_sym

		new_period_type = case current
		when Statistics::Calendar::PeriodType::WEEKLY
			if @period_type_cycle == :next
				Statistics::Calendar::PeriodType::YEARLY
			else
				Statistics::Calendar::PeriodType::MONTHLY
			end
		when Statistics::Calendar::PeriodType::MONTHLY
			if @period_type_cycle == :next
				Statistics::Calendar::PeriodType::WEEKLY
			else
				Statistics::Calendar::PeriodType::YEARLY
			end
		when Statistics::Calendar::PeriodType::YEARLY
			if @period_type_cycle == :next
				Statistics::Calendar::PeriodType::MONTHLY
			else
				Statistics::Calendar::PeriodType::WEEKLY
			end
		end

		@stats = Statistics::Calendar.new(current_user, new_period_type).generate_stats
	end

	def cycle_period
		period_type = params[:period_type].to_sym
		current = Date.parse(params[:current].gsub("_", "-"))

		new_start_date = case period_type
		when Statistics::Calendar::PeriodType::WEEKLY
			if @period_cycle == :next
				current + 7
			else
				current - 7
			end
		when Statistics::Calendar::PeriodType::MONTHLY
			if @period_cycle == :next
				current.end_of_month + 1
			else
				(current.beginning_of_month. - 1).beginning_of_month
			end
		when Statistics::Calendar::PeriodType::YEARLY
			if @period_cycle == :next
				current.end_of_year + 1
			else
				(current.beginning_of_year - 1).beginning_of_year
			end
		end

		new_end_date = case period_type
		when Statistics::Calendar::PeriodType::WEEKLY
			new_start_date.end_of_week
		when Statistics::Calendar::PeriodType::MONTHLY
			new_start_date.end_of_month
		when Statistics::Calendar::PeriodType::YEARLY
			new_start_date.end_of_year
		end

		@stats = Statistics::Calendar.new(current_user, period_type, Statistics::Calendar::Period.new(new_start_date, new_end_date)).generate_stats
	end
end
