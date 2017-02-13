class WordValidator
  def initialize
    @words = {}
    File.open("/usr/share/dict/words") do |file|
      file.each do |line|
        @words[line.strip] = true
      end
    end
  end

  def text_is_valid?(text)
    word_arr = text.split(" ")
    good_words = 0
    word_arr.each do |word|
      good_words +=1 if valid?(word.downcase)
    end
    good_words > (word_arr.length / 2)
  end

  def valid?(word)
    @words[word]
  end
end
