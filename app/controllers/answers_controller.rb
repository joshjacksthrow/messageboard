class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers/new
  def new
    @answer = @question.answers.build
  end

  # POST /answers or /answers.json
  def create
    @answer = @question.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_url(@question), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to question_url(@question), notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :question_id)
    end
end
