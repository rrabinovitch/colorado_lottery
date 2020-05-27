class Contestant
  attr_reader :full_name
  def initialize(contestant_params)
    @full_name = contestant_params[:first_name] + " " + contestant_params[:last_name]
  end
end
