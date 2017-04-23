class AboutController < ApplicationController
  def about_us
    @about = About.all
  end
end
