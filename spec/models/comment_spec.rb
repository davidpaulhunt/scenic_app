require 'spec_helper'

describe Comment do
  
  it 'should exist' do
    c = Comment.new
    c.should_not eq(nil)
  end

end