class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :home
  end

  get '/stations' do
    @stations = Station.all.view_order

    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/station-dashboard' do
    @stations = Station.all

    erb :"stations/dashboard"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])

    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])

    erb :"stations/edit"
  end

  post '/stations' do
    station = Station.create(params[:station])

    redirect "/stations/#{station.id}"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])

    redirect "/stations/#{id.to_i}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])

    redirect "/stations"
  end

  get '/trips' do
    @trips = Trip.limit(30)
    if params[:page]
      @trips = Trip.limit(30).offset((params[:page].to_i - 1) * 30)
      @paginate = params[:page]
      @pagdown = params[:page].to_i - 1
    end

    erb :'trips/index'
  end

  get '/trip-dashboard' do
    @trips = Trip.all

    erb :'trips/dashboard'
  end

  get '/trips/new' do
    erb :'trips/new'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])

    erb :'trips/edit'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])

    erb :'trips/show'
  end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])

    redirect "/trips/#{id.to_i}"
  end

  post '/trips' do
    trip = Trip.create(params[:trip])

    redirect "/trips/#{trip.id}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])

    redirect "/trips"
  end

  get '/conditions' do
    @conditions = Condition.all

    erb :'conditions/index'
  end

end
