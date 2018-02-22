class CodesController < ApplicationController
  def index
  end

  def process_code
    output = CodeServices::Process.new(params[:code]).run
    render json: { data: output }
  end

  def reset
    CodeServices::Restart.new.run
    render json: { data: "Interactive Shell Restarted" }
  end
end

