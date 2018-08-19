class ChecklistsController < ApplicationController
    def index
        @checklist = Checklist.all
    end

    def new
        @checklist = Checklist.new
    end

    def create
        @checklist = Checklist.new(checklist_params)
        if @checklist.save
            redirect_to("/sirabasus")
        else
            render :action => "new"
        end
    end

    def edit
        @checklist = Checklist.find(params[:id])
        
    end    

    def update
        @checklist = Checklist.find(params[:id])
        @checklist.update(checklist_params)
        redirect_to(sirabasus_path)
    end
    
    def destroy
        @checklist = Checklist.find(params[:id])
        @checklist.destroy
        redirect_to(sirabasus_path)
    end

    def checklist_params
        params.require(:checklist).permit(:number,:name,:content)
    end
end
