require "rails_helper"

describe Busall do
  after :all do
    Timecop.return
  end

  describe "#timetable" do
    context "shinagawa" do
      let(:place) { "shinagawa" }

      context "weekday" do
        before do
          t = Time.local(2015, 5, 11, 15, 0, 0)
          Timecop.travel t
        end

        it "return shinagawa weekday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromShinagawa.weekday
        end
      end

      context "saturday" do
        before do
          t = Time.local(2015, 5, 9, 15, 0, 0)
          Timecop.travel t
        end

        it "return shinagawa holiday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromShinagawa.holiday
        end
      end

      context "sunday" do
        before do
          t = Time.local(2015, 5, 10, 15, 0, 0)
          Timecop.travel t
        end

        it "return shinagawa holiday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromShinagawa.holiday
        end
      end

      context "japanese holiday" do
        before do
          t = Time.local(2015, 5, 5, 15, 0, 0)
          Timecop.travel t
        end

        it "return shinagawa holiday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromShinagawa.holiday
        end
      end
    end

    context "Gotenyama" do
      let(:place) { "gotenyama" }

      context "weekday" do
        before do
          t = Time.local(2015, 5, 11, 15, 0, 0)
          Timecop.travel t
        end

        it "return gotenyama weekday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromGotenyama.weekday
        end
      end

      context "saturday" do
        before do
          t = Time.local(2015, 5, 9, 15, 0, 0)
          Timecop.travel t
        end

        it "return gotenyama holiday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromGotenyama.holiday
        end
      end

      context "sunday" do
        before do
          t = Time.local(2015, 5, 10, 15, 0, 0)
          Timecop.travel t
        end

        it "return gotenyama holiday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromGotenyama.holiday
        end
      end

      context "japanese holiday" do
        before do
          t = Time.local(2015, 5, 5, 15, 0, 0)
          Timecop.travel t
        end

        it "return gotenyama holiday timetable" do
          obj = Busall.new(place)
          expect(obj.timetable).to eq Timetables::FromGotenyama.holiday
        end
      end
    end

    context "other_place" do
      let(:place) { "other" }

      it "invalid place" do
        obj = Busall.new(place)
        expect(obj.valid?).to be_falsy
      end
    end
  end
end
