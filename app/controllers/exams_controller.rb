class ExamsController < ApplicationController

def index
  @exams = Exam.all
end

def new
  @exam = Exam.new 
   1.times do
    question= @exam.questions.build
    4.times { question.answers.build } 
   end
end

def create
  @exam = Exam.new(exam_params)
  if @exam.save
    redirect_to exam_path(@exam)
  end
end 

def show
  @exam = Exam.find(params[:id])
  # @question = @exam.questions.build(params[:question])
  # @answer = @question.answers.build
end

def edit
  @exam = Exam.find(params[:id])
  # @exam.build_questions if @exam.question.nil?
end

def mark_as_correct_answer
  @answer = Answer.find(params[:answer_id])
  @question = Question.find(@answer.question_id)
  
  @question.answers.each do |an|
    if an.id == @answer.id
      @answer.correct_answer = true
      @answer.save!
    else
      an.correct_answer = false
      an.save!
    end
  end
end

def update
   @exam = Exam.find(params[:id])
  if @exam.update(exam_params)
    redirect_to exam_path(@exam)
  else
    render 'edit'
  end
end

def destroy
  @exam = Exam.find(params[:id])
  @exam.destroy
  redirect_to new_exam_path(@exam)
  # @exam = Exam.find(params[:id]).destroy
  # flash[:success] = "exam deleted"
  # redirect_to exams_path(@exam)
  end

private
  def exam_params
    params.require(:exam).permit(:id, :title, questions_attributes: [:id, :title ,:_destroy,answers_attributes: [:id, :title, :correct_answer,:_destroy]])
  end
  
end

  # @exam = Exam.find(params[:id])
 
  # if @exam.update(exam_params)
  #   redirect_to exam_path(@exam)
  # else
  #   render 'edit'
  # end
