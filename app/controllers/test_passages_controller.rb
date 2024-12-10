class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.finished?
      TestsMailer.completed_test(@test_passage).deliver_now
      BadgeService.new(@test_passage).call

      redirect_to result_test_passage_path(@test_passage), status: :see_other
    else
      render :show, status: 422
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
