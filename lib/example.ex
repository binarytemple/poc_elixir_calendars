defmodule July do

    def append_day( {{y,m,d} = ymd, dow} ) do
			dnum = case dow do
							 1 -> "Monday"
							 2 -> "Tuesday"
							 3 -> "Wednesday"
							 4 -> "Thursday"
							 5 -> "Friday"
							 6 -> "Saturday"
							 7 -> "Sunday"
						 end
			{ymd,dow,dnum}
		end



	  def append_dow({y,m,d} = ymd) do
        {ymd, Calendar.Date.day_of_week(ymd)}
    end

		@doc """
		generate a list of weekdays for the current month, and year
		"""
		@spec generate_weekdays() :: [{month, year, dow}]
	def generate_weekdays(), do: generate_weekdays( Calendar.Date.today_utc.month ,Calendar.Date.today_utc.year)



	@type month() :: integer()
	@type year() :: integer()
	@type dow() :: integer()
	

	
		@doc """
		generate a list of weekdays for a given  month, and year
		"""
		@spec generate_weekdays(month(), year()) :: [{month(),year(),dow()}]
    def generate_weekdays(month,year) do
		
			
			1..30 |> Enum.map(
				&({2016,7,&1})
			) |>
				Enum.map(&July.append_dow/1) |>
				Enum.map(&July.append_day/1) |>
        Enum.filter(
					fn({ymd,dnum,dow}) when dnum < 6 -> true;
						(_) -> false end
				)
    end

    def print_month() do
      generate_weekdays() |>
        Enum.each(
					fn( {{y,m,d} = ymd,dnum,dow} ) ->
						s = ("#{y}-#{m}-#{d}" |>  String.rjust(10))
						IO.puts(" #{s} - #{ dow |> String.ljust(10)} - ")
					end)
    end
end
