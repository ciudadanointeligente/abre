class ProblemsController < ApplicationController
  skip_authorization_check



  def show
    @problem = Problem.find(params[:id])
    @proposals = @problem.proposals.page


  end



end
