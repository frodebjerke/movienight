require 'test_helper'

class MovieTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

    test "should get correct movie given name" do
      skip
      res = Movie.getMovieByName('Toy+Story+3')
      assert_equal 1, res['total']
      assert_equal 'Toy Story 3', res['movies'][0]['title']

    end


    test "should get list of drama movies" do
      res = Movie.getRentalsByCategory('Drama');
      res.each {|m|
        has_drama = false
        m["genres"].each {  |gen|
          if ( gen.eql? "Drama")
            has_drama = true
          end
        }
        assert has_drama
      }
    end

end
