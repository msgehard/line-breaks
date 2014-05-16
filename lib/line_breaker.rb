class LineBreaker
  def initialize(max_length)
    @max_length = max_length
  end

  def break(input)
    output_lines = [""]
    input_lines = input.split("\n")
    input_lines.each do |line|
      words = line.split
      words.each do |word|
        if word_makes_line_too_long(word, output_lines.last)
          output_lines << ""
        end
        output_lines.last << word + " "
      end
    end
    output_lines.map { |line| line.strip }.join("\n")
  end

  def word_makes_line_too_long(word, output_line)
    output_line.length + word.length > @max_length
  end
end