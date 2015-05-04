describe Bus do
  after :all do
    Timecop.return
  end

  describe "#most_recent" do
    let(:place) { "gotenyama" }

    context "19:25" do
      before do
        t = Time.local(2015, 5, 11, 19, 25, 0)
        Timecop.travel t
      end

      it "現在時刻の直近の時間が返る" do
        expect(Bus.new(place).most_recent).to eq "19:30"
      end
    end

    context "現在時の時刻表が無い 3:00" do
      before do
        t = Time.local(2015, 5, 11, 3, 0, 0)
        Timecop.travel t
      end

      it "バスが無い" do
        expect(Bus.new(place).most_recent).to eq "Bus is over."
      end
    end

    context "現在時の最後のバスが無い" do
      context "次の時刻のバスがある 10:45" do
        before do
          t = Time.local(2015, 5, 11, 10, 45, 0)
          Timecop.travel t
        end

        it "次の時刻の直近の時間が返る" do
          expect(Bus.new(place).most_recent).to eq "11:0"
        end
      end

      context "次の時刻のバスが無い 22:10" do
        before do
          t = Time.local(2015, 5, 11, 22, 10, 0)
          Timecop.travel t
        end

        it "バスが無い" do
          expect(Bus.new(place).most_recent).to eq "Bus is over."
        end
      end
    end
  end
end
