require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
      # includes = params[:word].chars.all? { |letter| params[:word].count(letter) <= @letters.join.count(letter) }
# raise
      # if incudes == true

    # @letter = params[:word].split("")
      if (params[:word].split("") <=> params[:qqq].split("")) == -1

        url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
        word_read = open(url).read
        word_parsed = JSON.parse(word_read)

        if word_parsed["found"] == true
          @message = "Congratulations! #{params[:word]} is a valid English word!"

        elsif word_parsed["found"] == false
          @message = "Sorry, but #{params[:word]} does not seem to be a valid English word!"
        end
      else
        @message = "Sorry, but #{params[:word]} cannot be built out of #{params[:qqq]}"
      end
    end
  end
