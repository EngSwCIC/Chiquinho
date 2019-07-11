require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:schedule) { Schedule.new(time_8: Array.new(6), time_10: Array.new(6), time_12: Array.new(6), time_14: Array.new(6), time_16: Array.new(6), time_19: Array.new(6), time_21: Array.new(6)) }

  describe 'with relationships' do
    it { expect(schedule).to belong_to(:user) } # Testar relacionamento

    context 'with a user' do
      let(:user){ FactoryBot.create(:user) }

      it 'be valid' do
        schedule.user = user
        expect(schedule).to be_valid
      end
    end

    context 'without a user' do
      it 'not be valid' do
        expect(schedule).not_to be_valid
      end
    end
  end

  describe '#remove_subject' do
    let(:user) { FactoryBot.create(:user) }
    let(:subject) { FactoryBot.create(:subject) }

    before do
      schedule.user = user
      schedule.time_8 << subject.name
      ScheduleSubject.create(subject: subject, schedule: schedule)
      schedule.save!
    end

    it 'return empty schedule' do
      user.schedule.find_and_remove_subject(subject.name)
      expect(user.schedule.time_8).to eq([nil, nil, nil, nil, nil, nil, nil])
    end
  end

  describe '#get_avg' do
    let(:subject) { FactoryBot.create(:subject) }

    context 'when schedule has subjects' do
      before do
        schedule.subjects << subject
      end

      it 'return your schedule avg score' do
        expect(schedule.get_avg).to include({provas: 0.0, tarefas: 0.0, trabalhos: 0.0})
      end
    end

    context 'when schedule has not subjects' do
      it 'return your schedule avg score' do
        expect(schedule.get_avg).to include({provas: 0.0, tarefas: 0.0, trabalhos: 0.0})
      end
    end
  end

  describe '#reset' do
    let(:empty_schedule) { Schedule.new }

    before do
      schedule.time_10[0] = 'Engenharia de Software'
    end

    it 'retorna uma grade vazia' do
      schedule.reset
      expect(schedule.time_8).to eq(empty_schedule.time_8)
      expect(schedule.time_10).to eq(empty_schedule.time_10)
      expect(schedule.time_12).to eq(empty_schedule.time_12)
      expect(schedule.time_14).to eq(empty_schedule.time_14)
      expect(schedule.time_16).to eq(empty_schedule.time_16)
      expect(schedule.time_19).to eq(empty_schedule.time_19)
      expect(schedule.time_21).to eq(empty_schedule.time_21)
    end
  end

  describe '#add_subject' do
    let(:subject) { FactoryBot.create(:subject) }

    before do
      schedule.add_subject('time_8', 2, subject)
    end

    it 'return schedule with subject added' do
      expect(schedule.time_8[2]).to eq(subject.name)
    end

    it 'add subject in schedule subjects list' do
      expect(schedule.subjects).to include(subject)
    end
  end
end
