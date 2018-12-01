require 'rails_helper'

RSpec.describe SubjectClassesController, type: :controller do

  describe "GET #show" do
    let(:subject_class){ FactoryBot.create(:subject_class)}

    it "returns http success" do
      get :show, params: { id: subject_class.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add_class_schedule" do
    let(:subject_class){ FactoryBot.create(:subject_class)}
    let(:user) { FactoryBot.create(:user)}

    before do
      sign_in user

      week_day = WeekDay.create(day: "Segunda")
      class_hour = ClassHour.create(hour: "10:00")

      params = {subject_class_id: subject_class.id,
                week_day_id: week_day.id,
                class_hour_id: class_hour.id}

      ClassSchedule.create(params)
    end

    it "save a new schedule and redirect to schedule path" do
      expect{
        get :add_class_schedule, params: {id: subject_class.id}
      }.to change(user.schedule.subjects, :count).by(1)

      expect(response).to redirect_to(user_schedule_path)
    end

  end
end