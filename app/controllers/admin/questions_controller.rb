# frozen_string_literal: true

module Admin
  class QuestionsController < Admin::BaseController
    before_action :authenticate_user!
    before_action :find_test, only: %i[new create]
    before_action :find_question, only: %i[show destroy edit update]

    def show; end

    def new
      @question = @test.questions.new
    end

    def create
      @question = @test.questions.build(question_params)

      if @question.save
        redirect_to admin_test_path(@test)
      else
        render :new
      end
    end

    def destroy
      @question.destroy

      redirect_to admin_test_path(@question.test)
    end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to admin_test_path(@question.test)
      else
        render :edit
      end
    end

    private

    def question_params
      params.require(:question).permit(:body)
    end

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_question
      @question = Question.find(params[:id])
    end
  end
end
