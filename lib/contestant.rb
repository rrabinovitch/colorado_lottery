class Contestant
  attr_reader :full_name, :age, :state_of_residence, :spending_money, :game_interests
  def initialize(contestant_params)
    @full_name = contestant_params[:first_name] + " " + contestant_params[:last_name]
    @age = contestant_params[:age]
    @state_of_residence = contestant_params[:state_of_residence]
    @spending_money = contestant_params[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  # def add_game_interest(game)
  #
  # end
end
