class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @trainers = Trainer.all
    @clients = Client.all

  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to appointment_path(@appointment)
  end


  def show
    @appointment = Appointment.find(params[:id])
    @trainer = @appointment.trainer
    @client = @appointment.client
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end
  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes(appointment_params)
    redirect_to(appointment_path(@appointment))
  end

  def delete
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:trainer_id, :client_id, :time)
  end
end
