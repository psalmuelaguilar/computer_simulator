class CodesController < ApplicationController
  def index
    output = CodeServices::Process.new("def print_tenten\n  print(multiply(101,10))\nend\n").run
    binding.pry
    render json: { data: output }
  end

  def reset
    Rails.cache.clear
    render json: { data: "Done clearing cache" }
  end
end

