class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
  end

  def create
    @email = Email.new(object: Faker::ChuckNorris.fact, body: Faker::Lorem.sentence)

    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Email Received"
    else
      render root_path
      flash[:warning] = "Something went wrong"
    end
  end

  def update
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

end
