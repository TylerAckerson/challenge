class FileReader
  def initialize
    parse_questions_file
    parse_usage_file  
  end

  def parse_questions_file
    questions = File.readlines("questions.csv")
    questions.each { |line| puts line }
  end

  def parse_usage_file
    usages = File.readlines("usage.csv")
    usages.each { |line| puts line }
  end
end
