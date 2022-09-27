class FeedbacksController < ApplicationController

    def index
    end
    def new
        @feedback = Feedback.new
    end
    def create
        @feedback = Feedback.create(feedback_params)
        @trainer = @feedback.trainer
        @Client = @feedback.trainer

        if @feedback.save
            redirect_to trainer_path(@trainer)
        else
            render 'new'
        end
    end

    def edit
        @feedback = Feedback.find(params[:id])
    end
    def update
        @feedback = Feedback.find(params[:id])
        @trainer = @feedback.trainer
        @Client = @feedback.trainer
        if @feedback.update(feedback_params)
            redirect_to trainer_path(@trainer)
        else
            render "edit"
        end
    end

    def delete
        @feedback = Feedback.find(params[:id])
        @trainer = @feedback.trainer

    end

    def destroy
        @feedback = Feedback.find(params[:id])
        @trainer = @feedback.trainer
        @feedback.destroy
        redirect_to trainer_path(@trainer)
    end

    private

    def feedback_params
        params.require(:feedback).permit(:rating, :comment, :trainer_id, :client_id)
    end
end
