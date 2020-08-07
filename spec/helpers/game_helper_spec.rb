require 'rails_helper'

RSpec.describe GameHelper, type: :helper do
  describe '.game_commands_options' do
    subject { helper.game_commands_options }

    it do
      is_expected.to eq({ 'Place': '1', 'Move': '2', 'Left': '3', 'Right': '4' })
    end
  end

  describe 'robot_place?' do
    let(:game) do
      double position_line: robot_line, position_column: robot_column
    end

    subject { helper.robot_place? game, line, column }

    context 'when robot in the place' do
      let(:line) { rand(1..5) }
      let(:column) { rand(1..5) }
      let(:robot_line) { line }
      let(:robot_column) { column }

      it do
        is_expected.to be_truthy
      end
    end

    context 'when robot in not the place' do
      let(:line) { rand(1..5) }
      let(:column) { rand(1..5) }
      let(:robot_line) { line + 1 }
      let(:robot_column) { column + 1 }

      it do
        is_expected.to be_falsey
      end
    end
  end
end
