class SirabasusController < ApplicationController
  def index
      @sirabasus = Sirabasu.all
    end

    def show
      @sirabasus = Sirabasu.all
    end


    def new
      @sirabasu = Sirabasu.new
    end

    def create
      @sirabasu = Sirabasu.new(sirabasu_params)

      if @sirabasu.save
     redirect_to :action => "index"
      else
      render :action => "new"
      end
    end

    # データを更新するためのAction
    def update
      @sirabasu = Sirabasu.find(params[:id])
      @sirabasu.update(sirabasu_params)
      redirect_to :action => "index"
    end

    def edit
      @sirabasu = Sirabasu.find(params[:id])
    end

    # データを削除するためのAction
    def destroy
      @sirabasu = Sirabasu.find(params[:id])
      @sirabasu.destroy
      redirect_to sirabasus_path
    end

    def sirabasu_params
      params.require(:sirabasu).permit(:number,:name,:content)
    end
end
