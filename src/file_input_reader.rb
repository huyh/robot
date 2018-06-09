class FileInputReader
  def each_line(file)
    File.open(file).each do |line|
      yield(line)
    end
  end
end
