require 'test_helper'

class DuckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "rank" do
    Duck.new.valid? 
  end
end
