require "rails_helper"

describe "BusController", type: :request do
  after :all do
    Timecop.return
  end

  context "Bus is over" do
    before do
      t = Time.local(2015, 5, 11, 23, 25, 0)
      Timecop.travel t
    end

    describe "GET /bus/shinagawa" do
      before { get "/bus/shinagawa" }

      it { expect(response.body).to be_json_as("response" => "Bus is over.") }
      it { expect(response).to have_http_status 200 }
    end
  end

  context "Shinagawa" do
    before do
      t = Time.local(2015, 5, 11, 19, 25, 0)
      Timecop.travel t
    end

    describe "GET /bus/shinagawa" do
      before { get "/bus/shinagawa" }

      it { expect(response.body).to be_json_as("response" => "19:32") }
      it { expect(response).to have_http_status 200 }
    end
  end

  context "Gotenyama" do
    before do
      t = Time.local(2015, 5, 11, 19, 25, 0)
      Timecop.travel t
    end

    describe "GET /bus/gotenyama" do
      before { get "/bus/gotenyama" }

      it { expect(response.body).to be_json_as("response" => "19:27") }
      it { expect(response).to have_http_status 200 }
    end
  end

  context "Other" do
    describe "GET /bus/other" do
      before { get "/bus/other" }

      it { expect(response.body).to be_json_as("response" => { "from_place" => ["Invalid place. Valid place is gorenyama or shinagawa."] }) }
      it { expect(response).to have_http_status 404 }
    end
  end
end
