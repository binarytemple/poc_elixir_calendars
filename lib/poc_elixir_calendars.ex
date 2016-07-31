defmodule PocElixirCalendars do

  def main(args) do
		Application.ensure_started(:calendar)
		inspect(Application.loaded_applications)
    IO.puts "Hello from escript"
    IO.inspect args
  end 

end
