class Contestant
  attr_reader :full_name, :age, :state_of_residence, :spending_money
  def initialize(contestant_params)
    @full_name = contestant_params[:first_name] + " " + contestant_params[:last_name]
    @age = contestant_params[:age]
    @state_of_residence = contestant_params[:state_of_residence]
    @spending_money = contestant_params[:spending_money]
  end
end
