require 'byebug'
require_relative 'file_reader'

class QuestionGenerator
  def initialize(file_reader)
    @file_reader = file_reader
  end

  def prompt_for_count
    puts "How many questions would you like to answer?"
    print ">> "

    count = gets.chomp.to_i

    if count < 1 || !(count % 1).zero?
      puts "Please enter an integer 1 or greater."
      prompt_for_count
    else
      question = count == 1 ? "question" : "questions"
      puts "#{count} #{question} coming right up!"

      display_questions(count)
    end

  end

  def display_questions(num_questions)
    questions_list = @file_reader.get_questions(num_questions)
    questions_list.each { |question| puts "Question id: #{question}" }
  end

end

if __FILE__ == $PROGRAM_NAME
  file_reader = FileReader.new
  question_gen = QuestionGenerator.new(file_reader)
  question_gen.prompt_for_count
end
