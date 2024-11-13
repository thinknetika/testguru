class TestsController < ApplicationController
  def start
    @test = Test.find(params[:id])

    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test)
  end

  def index
    @tests = Test.all
  end
end
