require 'byebug'

require_relative 'file_reader'

class QuestionGenerator
  def prompt_for_count
    puts "How many questions would you like to answer?"
    print ">> "

    count = gets.chomp.to_i

    if count < 1 || !(count % 1).zero?
      puts "Please enter an integer 1 or greater."
      prompt_for_count
    else
      question = count == 1 ? "question" : "questions"
      puts "Okay -- #{count} #{question} coming right up!"

      display_questions(count)
    end

  end

  def display_questions(num_questions)
    puts "here are the #{num_questions} questions"

  end
end

if __FILE__ == $PROGRAM_NAME
  question_gen = QuestionGenerator.new
  file_reader = FileReader.new
  question_gen.prompt_for_count
end
