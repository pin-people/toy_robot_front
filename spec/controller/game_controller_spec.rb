require 'rails_helper'

RSpec.describe GameController, type: :controller do
  describe 'GET index' do
    subject { get :index }

    it do
      subject
      expect(assigns(:game)).to be_an_instance_of(RobotToyJonhnes::Game)
    end
  end
end