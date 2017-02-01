require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do
  def json_body
    JSON.parse(response.body)
  end

  describe "RDBMS-backed" do
    before(:each) { Foo.delete_all }
    after(:each) { Foo.delete_all }

    it "creates RDBMS-backed model" do
      foo = Foo.new(name: 'lol')
      foo.save
      expect(Foo.find(foo.id).name).to eq('lol')
    end

    it "exposes RDBMS-backed API resource" do
      foo = Foo.create(name: 'lol')
      get foo_path(foo.id)
      expect(response).to have_http_status(200)
      expect(json_body['name']).to eq('lol')
    end

    it "expose RDBMS-backed API under the right path" do
      expect(foos_path).to include('/api/')
      get foos_path
      expect(response).to have_http_status(200)
    end
  end

  describe "MongoDB-backed" do
    before(:each) { Bar.delete_all }
    after(:each) { Bar.delete_all }

    it "create MongoDB-backed model" do
      bar = Bar.new(name: 'lol')
      bar.save
      expect(Bar.find(bar.id).name).to eq('lol')
    end

    it "expose MongoDB-backed API resource" do
      bar = Bar.create(name: 'lol')
      get bar_path(bar.id)
      expect(response).to have_http_status(200)
      expect(json_body['name']).to eq('lol')
      expect(json_body).to include('created_at')
      expect(json_body).to include("id" => bar.id.to_s)
    end

    it "expose MongoDB-backed API under the right path" do
      expect(bars_path).to include('/api/')
      get bars_path
      expect(response).to have_http_status(200)
    end
  end
end
