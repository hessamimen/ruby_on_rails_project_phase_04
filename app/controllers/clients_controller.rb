class ClientsController < ApplicationController

  layout "admin"
  before_action :confirm_logged_in


  def index
    @clients = Client.by_earliest_created
  end

  def new
    @client = Client.new
    @client.addresses.build

  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
    redirect_to clients_path
    else
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update_attributes(client_params)
    redirect_to(client_path(@client))
  end

  def delete
    @client = Client.find(params[:id])

  end

  def destroy
    @client = Client.find(params[:id])
    # @client.appointments.each do |appt|
    #   appt.destroy
    # end
    @client.destroy
    redirect_to clients_path

  end

  private
  def client_params
  params.require(:client).permit(
    :name, :gender,
    addresses_attributes: [
      :city,
      :state,
      :post_code
    ]
  )
end
end
