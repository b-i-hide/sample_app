require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    subject{ get :new }
    it "responds successfully with an HTTP 200 status code" do
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end
  end
end
