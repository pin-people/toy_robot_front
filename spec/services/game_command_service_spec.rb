require 'rails_helper'

RSpec.describe GameCommandService do
  describe 'initialize' do
    let(:game) { double }
    let(:params) { { command: rand(1..4).to_s, place: Faker::Lorem.word } }
    subject { described_class.new(game, params) }

    it do
      is_expected.to have_attributes(game: game, command: params[:command],
                                     place: params[:place])
    end
  end

  describe '.execute' do
    let(:game) { RobotToyJonhnes::Game.new }
    let(:params) { { command: command, place: Faker::Lorem.word } }
    let(:service) { described_class.new(game, params) }

    after { service.execute }

    context 'when place command' do
      let(:command) { '1' }

      it do
        expect(game).to receive(:place).with(params[:place]) { nil }
      end
    end

    context 'when move command' do
      let(:command) { '2' }

      it do
        expect(game).to receive(:move) { nil }
      end
    end

    context 'when rotate left command' do
      let(:command) { '3' }

      it do
        expect(game).to receive(:rotate_left) { nil }
      end
    end

    context 'when rotate right command' do
      let(:command) { '4' }

      it do
        expect(game).to receive(:rotate_right) { nil }
      end
    end
  end
end
