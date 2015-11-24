class FileReader
  def initialize
    @questions = parse_questions_file
    @usages = parse_usage_file
    @current_strand = "strand1"
  end

  def get_questions(count)
    questions_list = []
    question_counter = 0

    count.times do
      add = @questions[@current_strand][question_counter].split(",")[-2].strip
      questions_list << add
      switch_strand

      question_counter += 1 if @current_strand == "strand2"
      if question_counter >= @questions[@current_strand].length
        question_counter = question_counter % @questions[@current_strand].length
      end

    end

    questions_list
  end

  def switch_strand
    @current_strand = @current_strand == 'strand1' ? 'strand2' : 'strand1'
  end

  def parse_questions_file
    questions = File.readlines("questions.csv")

    strand1, strand2 = questions[1..-1].partition.with_index do |question, idx|
      question.split(",").first.to_i == 1
    end

    { 'strand1' => strand1,
      'strand2' => strand2 }
  end

  def parse_usage_file
    File.readlines("usage.csv")
  end
end
