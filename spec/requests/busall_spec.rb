require "rails_helper"

describe "Busallontroller", type: :request do
  before :all do
    t = Time.local(2015, 5, 11, 19, 25, 0)
    Timecop.travel t
  end

  after :all do
    Timecop.return
  end

  context "Shinagawa" do
    describe "GET /busall/shinagawa" do
      before { get "/busall/shinagawa" }

      it { expect(response.body).to be_json_as("response" => Timetables::FromShinagawa.weekday) }
      it { expect(response).to have_http_status 200 }
    end
  end

  context "Gotenyama" do
    describe "GET /busall/gotenyama" do
      before { get "/busall/gotenyama" }

      it { expect(response.body).to be_json_as("response" => Timetables::FromGotenyama.weekday) }
      it { expect(response).to have_http_status 200 }
    end
  end

  context "Other" do
    describe "GET /busall/other" do
      before { get "/busall/other" }

      it { expect(response.body).to be_json_as("response" => { "from_place" => ["Invalid place. Valid place is gorenyama or shinagawa."] }) }
      it { expect(response).to have_http_status 404 }
    end
  end
end
