class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end
  
  def new
    @client = Client.new
    @client.addresses.build

  end

  def create
    @client = Client.create(client_params)
    # redirect_to client_path(@client)
  end

  def show
  end

  def edit
  end

  private
  def client_params
  params.require(:client).permit(
    :name,
    address_attributes: [
      :city,
      :state,
      :post_code
    ]
  )
end
end
