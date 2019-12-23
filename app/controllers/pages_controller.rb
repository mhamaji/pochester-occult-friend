class PagesController < ApplicationController
  def home
  end

  def draw
    # Redirects if no param given
    render :home and return if params[:amount].nil? || params[:amount] == ''

    # Gets the amount of people for the draw
    amount = params[:amount].to_i

    # Creates an array of numbers for the amount given
    @numbers = (1..amount).to_a

    # Array to store the draw
    @draw_array = []

    # Starts with 1
    last_selected = 1

    # Removes 1 from the draw
    @numbers.delete(1)

    # Repeat proccess given amount times less 1
    (amount-1).times do
      # Draws random number
      current_selected = @numbers.sample

      # Removes number from selection
      @numbers.delete(current_selected)

      # Stores key value pair
      @draw_array << {"#{last_selected}": current_selected }

      # Sets drawn number as last selected number
      last_selected = current_selected
    end

    # Sets last drawn to the first to select
    @draw_array << {"#{last_selected}": 1 }
  end

end
