defmodule Todo do
   #ask user for filename
    #open file and read
    #parse the data
    #ask user for command
    #read todos, add todos, delete todos, load file, save file

  def start do
    filename = IO.gets("Name of the CSV to load: ")
              |> String.trim
    read(filename)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, body} -> body
      parse(body)
      {:error, reason} -> IO.puts ~s(Could not open file "#{filename}"\n)
                          IO.inspect(reason)
                          start()
    end
  end

  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header, ",")
    parse_lines(lines, titles)
  end

  def parse_lines(lines, titles) do

    Enum.reduce(lines, %{}, fn line, built ->
      [name | fields] = String.split(line, ",")

      if Enum.count(fields) == Enum.count(titles) do
        line_data = Enum.zip(titles,fields) |> Enum.into(%{})
        Map.merge(built, %{name => line_data})
      else
        built
      end

    end)
  end
end #module end
