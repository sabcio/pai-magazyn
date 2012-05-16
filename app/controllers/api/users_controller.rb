class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render xml: @users, only: [:name, :address, :id]
  end

  def show
    @user = User.find(params[:id])
    render xml: @user, only: [:name, :address, :id]
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      render xml: @user, status: :created, location: @user
    else
      render xml: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      head :no_content
    else
      render xml: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
end
