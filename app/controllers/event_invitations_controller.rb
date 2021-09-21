class EventInvitationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @invitation = EventInvitation.new(invitation_params)
  end

  def create
    @invitation = EventInvitation.new(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation.event, notice: 'Invitation was successfully created.' }
      else
        format.html { redirect_back fallback_location: root_path, notice: @invitation.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def invitation_params
    params.require(:event_invitation).permit(:user_id, :event_id)
  end
end
