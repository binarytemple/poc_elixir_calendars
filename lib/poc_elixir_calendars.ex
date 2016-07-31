defmodule PocElixirCalendars do

  def main(args) do
		inspect(Application.loaded_applications)
    IO.puts "Hello from escript"
    IO.inspect args
  end 

end
