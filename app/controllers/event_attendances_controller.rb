class EventAttendancesController < ApplicationController
  before_action :set_event_attendance, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # POST /event_attendances or /event_attendances.json
  def create
    @event_attendance = current_user.event_attendances.new(event_attendance_params)

    respond_to do |format|
      if @event_attendance.save
        format.html { redirect_back fallback_location: root_path }
        format.json { render :show, status: :created, location: @event_attendance }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @event_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_attendances/1 or /event_attendances/1.json
  def destroy
    @event_attendance.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_attendance
    @event_attendance = EventAttendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_attendance_params
    params.require(:event_attendance).permit(:event_id)
  end
end
