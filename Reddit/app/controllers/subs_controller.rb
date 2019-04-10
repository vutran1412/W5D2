class SubsController < ApplicationController
    def index
      @subs = Sub.all
    end

    def new
      @sub = Sub.new
    end

    def create
      @sub = Sub.new(sub_params)

      @sub.moderator = current_user.id
      if @sub.save!
        redirect_to sub_url(@sub)
      else
        flash[:errors] = @sub.errors.full_messages
        render :new
      end
    end

    def show
      @sub = Sub.find(params[:id])
      if @sub
        render :show 
      else
        flash[:errors] = ['Invalid Url']
      end
    end

    private
    def sub_params
      params.require(:sub).permit(:title, :description)
    end
end