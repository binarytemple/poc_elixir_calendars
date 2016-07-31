defmodule July do

	@type month() :: integer()
	@type year() :: integer()
	@type day() :: integer()
	@type dow() :: integer()
	@type dayname() :: String.t
	@type ymd() :: {year(),month(),day()}


	@spec get_day(dow()) :: dayname()
  def get_day(dow) do
		case dow do
			1 -> "Monday"
			2 -> "Tuesday"
			3 -> "Wednesday"
			4 -> "Thursday"
			5 -> "Friday"
			6 -> "Saturday"
			7 -> "Sunday"
		end
	end

	@spec append_day_info(ymd()) :: {ymd(),dow(),dayname()}
	def append_day_info(ymd) do
		dow = Calendar.Date.day_of_week(ymd)
		{ymd, dow, get_day(dow)}
  end

		@doc """
		generate a list of weekdays for the current month, and year
		"""
		@spec generate_weekdays() :: [{month(), year(), dow()}]
	def generate_weekdays(), do: generate_weekdays( Calendar.Date.today_utc.month ,Calendar.Date.today_utc.year)
	
		@doc """
		generate a list of weekdays for a given  month, and year
		"""
		@spec generate_weekdays(month(), year()) :: [{month(),year(),dow(),day()}]
    def generate_weekdays(month,year) do
			Range.new(1,Calendar.Date.number_of_days_in_month({year,month,1})) |>
				Enum.map(
					&({year,month,&1})
				) |>
				Enum.map(
					&(append_day_info(&1))
				) |>
				Enum.filter(
					fn({_,dow,_}) -> dow < 6 == true end
				)
    end

    def print_month() do
      generate_weekdays() |>
        Enum.each(
					fn( {{y,m,d},dnum,dow} ) ->
						symd = String.rjust("#{y}-#{m}-#{d}", 10)
						sdnum = String.rjust("#{dnum}",4)
						sdow = String.ljust("#{dow}",10)
						IO.puts("#{symd} #{sdnum} #{sdow}")
					end)
    end
end
