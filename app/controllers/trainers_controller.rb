class TrainersController < ApplicationController

  layout "admin"
  before_action :confirm_logged_in

  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to trainers_path
    else
      render 'new'
    end
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def edit
    @trainer = Trainer.find(params[:id])

  end
  def update
    @trainer = Trainer.find(params[:id])
    @trainer.update_attributes(trainer_params)
    redirect_to(trainer_path(@trainer))
  end

  def delete
    @trainer = Trainer.find(params[:id])
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.appointments.each do |appt|
      appt.destroy
    end
    @trainer.destroy
    redirect_to trainers_path
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :gender)
  end
end
