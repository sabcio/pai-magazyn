class LogsController < ApplicationController

  def show

puts Rails.env
    @out = `tail -n 200 log/#{Rails.env}.log`
    @out.gsub!("\n", "<br/>")
    render :layout => false
  end

end