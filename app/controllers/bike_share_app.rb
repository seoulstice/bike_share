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
    @trips = Trip.all

    erb :'trips/index'
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

end
