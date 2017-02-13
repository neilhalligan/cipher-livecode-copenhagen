require 'caesar'
require 'word_validator'

class SuperCypherController < ApplicationController
  def home
    #does nothing. we just render a form here
  end

  def decypher
    @encoded_message = params[:encoded_message]
    @solutions = Caesar.decrypt_message(@encoded_message)
    validator = WordValidator.new
    @best_guess = "I couldn't guess, sorry :("
    @solutions.each do |solution|
      if validator.text_is_valid?(solution)
        @best_guess = solution
      end
    end
  end
end
