require './environment'


require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    # post '/pirates' do
    #   params["pirate"]["ships"].each do |ship_data|
    #     Ship.new(ship_data["name"], ship_data["type"], ship_data["booty"])
    #   end

    #   @pirate = Pirate.new(params["pirate"]["name"], params["pirate"]["height"], params["pirate"]["weight"])

    #   @ships = Ship.all

    #   erb :'pirates/show'
    # end

    post '/pirates' do 

      # @pirate = Pirate.new(params[:pirate])

      @pirate = Pirate.new(params["pirate"]["name"], params["pirate"]["height"], params["pirate"]["weight"])

      params[:pirate][:ships].each do |details|
        Ship.new(details[:name], details[:type], details[:booty])
      end 

      @ships = Ship.all

      erb :'pirates/show'

    end 


    # post '/student' do
    #   @student = Student.new(params[:student])
    
    #   params[:student][:courses].each do |details|
    #     Course.new(details)
    #   end
    
    #   @courses = Course.all
    
    #   erb :student
    # end 
  end
end
