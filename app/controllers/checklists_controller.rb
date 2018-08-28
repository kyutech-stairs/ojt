class ChecklistsController < ApplicationController
    def choose_sirabasus
@sirabasus = Sirabasu.all.order(:number)
    end
    def index
        @checklist = Checklist.all
    end

    def new
        @checklist = Checklist.new
        @num = params[:num]
    end

    def create
        @sirabasu = Sirabasu.find(params[:num])
        @checklist = @sirabasu.checklists.new(checklist_params)
        @num = params[:num]
        if @checklist.save
            redirect_to("/kanri/kanri_top")
        else
            render "new"
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
