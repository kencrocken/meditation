class MeditationSessionsController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    before_action :set_session, only: [:show, :edit, :update, :destroy]


    def index
        if user_signed_in?
          @user = current_user
          @meditation_session = current_user.meditation_session.all
        end
    end

    def show
    end

    def new
        @meditation_session = current_user.meditation_session.new
    end

    def create
        @meditation_session = current_user.meditation_session.new(session_params)
        if @meditation_session.save
            flash[:notice] = "Meditation session created."
            respond_to do |format|
                format.html { redirect_to meditation_session_path(@meditation_session.id) }
                # format.js
            end
        else
            flash[:notice] = "Sorry, seems there was an error."
            respond_to do |format|
                format.html { redirect_to root_path }
            end
        end
    end

    def edit
    end

    def update
        @meditation_session.update!(session_params)
        flash[:notice] = "Meditation session completed."
        redirect_to root_path
    end
    def destroy
        @meditation_session.destroy
        flash[:notice] = "Project deleted."
        redirect_to root_path
    end

    private

    def session_params
      params.require(:meditation_session).permit(:time_spent)
    end

    def set_session
        @meditation_session = current_user.meditation_session.find params[:id]
    end

end
