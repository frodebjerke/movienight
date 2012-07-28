require 'rubygems'
require 'rest_client'
require 'json'

class Movie < ActiveRecord::Base

  # the URL for the Rotten tomatoes api
  @@url = 'http://api.rottentomatoes.com/api/public/v1.0/movies.json?'

  # the API key
  @@api_key = 'w65g4kz3np7puc8nf8cun4bz'

  @@__arg__ = '$$$'

  @@search_query = "apikey=#{@@__arg__}&q=#{@@__arg__}&page_limit=1"

  # performs the GET request to get a movie from the rotten tomatoes API
  def self.getMovieByName(name)
    jSON_response = RestClient.get mergeNameIntoSearchUrl name
    return parsejSON jSON_response
  end

  # returns a human-friendly text version of the response from Twitter
  def self.parsejSON(name)
    return JSON.parse(name)

    #puts hashOfResponse
    ##textOfResponse = "Link template\n----------------\n\n"
    #textOfResponse += "Results for: "+hashOfResponse['total']+"\n\n"
    # loop over the trends URLs returned and append them to the string to return

    #return textOfResponse
  end

  private

  def self.mergeNameIntoSearchUrl(name)
    @@url + (@@search_query.sub(@@__arg__, @@api_key)).sub(@@__arg__, name )
  end
end
