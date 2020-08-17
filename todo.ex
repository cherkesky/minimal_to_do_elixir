defmodule Todo do
   #ask user for filename
    #open file and read
    #parse the data
    #ask user for command
    #read todos, add todos, delete todos, load file, save file
  def start do
    filename = IO.gets("Name of the CSV to load: ")
              |> String.trim

  end

  def read(filename) do
    case File.read(filename) do
      {:ok, body} -> body
      {:error, reason} -> IO.puts ~s(Could not open file "#{filename}"\n)
                          IO.inspect(reason)
    end
  end



end