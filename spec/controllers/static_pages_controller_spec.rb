require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    subject{ get :home }
    it "responds successfully with an HTTP 200 status code" do
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end

    it "renders the home template" do
      expect(subject).to render_template('home')
    end
  end

  describe 'GET #help' do
    subject{ get :help }
    it "responds successfully with an HTTP 200 status code" do
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end

    it "renders the help template" do
      expect(subject).to render_template('help')
    end
  end

  describe 'GET #about' do
    subject{ get :about }
    it "responds successfully with an HTTP 200 status code" do
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end

    it "renders the about template" do
      get :about
      expect(subject).to render_template ('about')
    end
  end

  describe "GET #contact" do
    subject{ get :contact }
    it 'responds successfully with an HTTP 200 status code' do
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end

    it "renders the about template" do
      get :contact
      expect(subject).to render_template ('contact')
    end
  end
end
