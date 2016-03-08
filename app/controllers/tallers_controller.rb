class TallersController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :evento, [:new, :create]

  

end
