class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  
  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = current_user.plans.build
  end

  def edit
  end

  def create
    @plan = current_user.plans.build(plan_params)

      if @plan.save
        redirect_to @plan, notice: 'Plan was successfully created.' 
      else
        render action: 'new' 
      end
  end

  # PATCH/PUT /plans/1
  def update
      if @plan.update(plan_params)
        redirect_to @plan, notice: 'Plan was successfully updated.' 
      else
        render action: 'edit' 
      end
  end

  # DELETE /plans/1
  def destroy
    @plan.destroy
      redirect_to plans_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def correct_user
      if current_user.try(:admin?)
        @plan = Plan.find_by(id: params[:id])
      else
      @plan = current_user.plans.find_by(id: params[:id])
      redirect_to plans_path, notice: "Not authorized to view or modify this Plan" if @plan.nil?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name, :owneremail, :ownerphone, :domain, :company, :address, :phone, :fax, :tollfree, :goals, :primary, :secondary, :demographic, :websites, :dollars, :competitors, :emails, :notes)
    end
end
