# frozen_string_literal: true

# Controller for static pages.
class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def home
  end
end
