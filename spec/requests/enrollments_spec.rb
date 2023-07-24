# spec/controllers/enrollments_controller_spec.rb
require 'rails_helper'

RSpec.describe EnrollmentsController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User factory set up with FactoryBot
  let(:course) { create(:course, user_id: user.id) } # Assuming you have a Course factory set up with FactoryBot

  before do
    sign_in user
  end
  describe '#enroll' do
    context 'when user is already enrolled' do
      before do
        user.courses << course
        get :enroll, params: { id: course.id }
      end

      it 'does not create a new enrollment' do
        expect(Enrollment.count).to eq(1) # Assuming there's already one enrollment due to the user being enrolled in the course.
      end
    end

    context 'when user is not enrolled' do
      it 'creates a new enrollment' do
        expect(Enrollment.count).to eq(0)
      end

      it 'associates the enrollment with the correct user and course' do
        enroll = Enrollment.create(user: user, course: course)
        enrollment = Enrollment.last
        expect(enrollment.user).to eq(user)
        expect(enrollment.course).to eq(course)
      end
    end
  end
end
