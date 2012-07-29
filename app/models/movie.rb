require 'rubygems'
require 'rest_client'
require 'json'

class Movie < ActiveRecord::Base


  # the API key
  @@api_key = 'apikey=w65g4kz3np7puc8nf8cun4bz'

  # Used to substitute in a url argument
  @@arg = '$$$'

  @@api_base_url = "http://api.rottentomatoes.com/api/public/v1.0/"

  # Search for a movie
  @@url_movie_query = "#{@@api_base_url}movies.json?#{@@api_key}&q=#{@@arg}&page_limit=1"

  # Get movie by id
  @@url_movie_by_id = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{@@arg}.json?#{@@api_key}"

  # get list of movies
  @@url_curr_releases = "#{@@api_base_url}lists/dvds/current_releases.json?page_limit=#{@@arg}&page=1&country=us&#{@@api_key}"



  # performs the GET request to get a movie from the rotten tomatoes API
  def self.getMovieByName(name)
    name = urlParse name
    url = mergeArgIntoUrl name, @@url_movie_query
    jSON_response = RestClient.get ( url )
    return parsejSON jSON_response
  end

  def self.getMovieById(id)
    url = mergeArgIntoUrl id, @@url_movie_by_id
    jSON_response = RestClient.get( url)
    return parsejSON jSON_response
  end


  def self.getRentalsByCategory(category)
    url = mergeArgIntoUrl "50",  @@url_curr_releases
    json_res = parsejSON ( RestClient.get url   )
    filtered_list = filterMovieHashByCaterogy(json_res, category)
  end

  def self.getTopListByCategory(category_name)
    jSON_response = RestClient.get mergeNameIntoSearchUrl
  end
  # returns a human-friendly text version of the response from Twitter
  def self.parsejSON(name)
    return JSON.parse(name)
  end

  private

  def self.mergeArgIntoUrl(name, url)
    return url.sub @@arg, name
  end

  def self.urlParse (name)
    s = name.gsub(/\s/, "\+")
    return s
  end

  def self.filterMovieHashByCaterogy(allMovies,category)
    res = []
    allMovies["movies"].each { |key, val |

      # must get each movie to get movie details (which includes genre)
      mov = getMovieById (key["id"])

      mov["genres"].each { |cat|
        if ( cat.eql? category  )
          res.push mov
        end
      }
    }
    return res
  end
end
