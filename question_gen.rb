require 'byebug'

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
  end

end

prompt_for_count
