class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @client.addresses.build

  end
  
  def create
    @client = Client.create!(client_params)
    # redirect_to client_path(@client)
    redirect_to clients_path
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
    @client.addresses.build
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
