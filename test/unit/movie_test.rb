require 'test_helper'

class MovieTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

    test "should get correct movie given name" do
      res = Movie.getMovieByName('Toy+Story+3')
      assert_equal 1, res['total']
      assert_equal 'Toy Story 3', res['movies'][0]['title']
    end

end
