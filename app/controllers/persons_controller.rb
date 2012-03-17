class PersonsController < ApplicationController

  def index
    response = client.request :wsdl, :add do
      soap.body = {j: 1, i: 3}
    end
    render :text => response.body
  end

  def client
    @client = Savon::Client.new do
      wsdl.document = "http://172.20.56.185:8080/Server/CalculatorWS?WSDL"
      wsdl.element_form_default = :unqualified
    end
  end
end
