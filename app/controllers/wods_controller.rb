class WodsController < ApplicationController
  def index
    @workouts = load_data
  end

  private

  def load_data
    file_path = Rails.root.join('config', 'workouts.yml')
    YAML.load_file(file_path)
  end
end
