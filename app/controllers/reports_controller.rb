class ReportsController < ApplicationController
  before_action :set_comment, only: [:create]
  def new
  end

  def create
    @report = @comment.reports.new(report_params)
    respond_to do |format|
      if @report.save
        format.json { render json: { status: 'success', message: 'Report submitted successfully.' }, status: :created }
      else
        format.json { render json: { status: 'error', errors: @report.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def index
  end

  private
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
  def report_params
    params.permit(:reason, :details,:post_id)
  end
end
