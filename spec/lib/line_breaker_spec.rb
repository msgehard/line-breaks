require 'line_breaker'

describe LineBreaker do
  it 'can break a line when the line is shorter than the max length' do
    input = <<-INPUT.chomp
Hello
    INPUT

    expected = <<-EXPECTED.chomp
Hello
    EXPECTED

    breaker = LineBreaker.new(6)

    expect(breaker.break(input)).to eq expected
  end

  it 'can break a line when a word boundary matches the max length' do
    input = <<-INPUT.chomp
Hello World
    INPUT

    expected = <<-EXPECTED.chomp
Hello
World
    EXPECTED

    breaker = LineBreaker.new(6)
    expect(breaker.break(input)).to eq expected
  end

  it 'can handle a really long line' do
    input = <<-INPUT.chomp
Jean shorts you probably haven't heard of them farm-to-table.
    INPUT

    expected = <<-EXPECTED.chomp
Jean shorts you
probably haven't
heard of them
farm-to-table.
    EXPECTED

    breaker = LineBreaker.new(20)
    expect(breaker.break(input)).to eq expected
  end

  it 'can handle multiple lines' do
    input = <<-INPUT.chomp
Jean shorts you probably haven't heard of them farm-to-table.
Another line.
    INPUT

    expected = <<-EXPECTED.chomp
Jean shorts you
probably haven't
heard of them
farm-to-table.
Another line.
    EXPECTED

    breaker = LineBreaker.new(20)
    expect(breaker.break(input)).to eq expected
  end
end