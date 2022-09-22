class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.create(trainer_params)
    redirect_to trainers_path
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
    @trainer.destroy
    redirect_to trainers_path
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :gender)
  end
end
