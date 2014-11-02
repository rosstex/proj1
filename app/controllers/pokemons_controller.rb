class PokemonsController < ApplicationController

  def new
  end

  def create
  	@pokemon = Pokemon.new(pokemon_params)
  	@pokemon.level = 1
  	@pokemon.health = 100
  	@pokemon.trainer_id = current_trainer.id
  	if @pokemon.save
      redirect_to current_trainer
	else
  	  flash[:error] = @pokemon.errors.full_messages.to_sentence
  	  render 'new'
  	end
  end

  def capture
	@pokemon = Pokemon.find(params[:id])
	@pokemon.trainer_id = current_trainer.id
	@pokemon.save
	redirect_to root_path
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.health -= 10
  	@pokemon.save
  	if @pokemon.health <= 0
  		@pokemon.destroy
  	end
  	redirect_to @pokemon.trainer
  end

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end