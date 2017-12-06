class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :home
  end

  get '/stations' do
    @stations = Station.all.order(:name)

    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/station-dashboard' do
    @stations = Station.all
    top_5_stations = Trip.top_five_stations
    @top_5_station_pie = Station.station_pie_chart(top_5_stations)
    @avg_latitude = Station.average(:latitude)
    @avg_longitude = Station.average(:longitude)

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
    @best_weather = Condition.find_by(date: Trip.date_with_most_rides)
    @worst_weather = Condition.find_by(date: Trip.date_with_least_rides)

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
    @end_station = Station.find(@trip.end_station_id)


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
    @conditions = Condition.limit(30)
    if params[:page]
      @conditions = Condition.limit(30).offset((params[:page].to_i - 1) * 30)
      @paginate = params[:page]
      @pagdown = params[:page].to_i - 1
    end

    erb :'conditions/index'
  end

  get '/conditions/new' do
    erb :'conditions/new'
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])

    erb :'conditions/show'
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])

    erb :"conditions/edit"
  end

  post '/conditions' do
    condition = Condition.create(params[:condition])

    redirect "/conditions/#{condition.id}"
  end

  put '/conditions/:id' do |id|
    Condition.update(id.to_i, params[:condition])

    redirect "/conditions/#{condition.id}"
  end

  delete '/conditions/:id' do
    Condition.destroy(params[:id])

    redirect '/conditions'
  end

  get '/weather-dashboard' do
    @ride_by_temp = Condition.ride_by_temp
    @ride_by_wind  = Condition.ride_by_wind
    @ride_by_vis = Condition.ride_by_vis
    @ride_by_precip = Condition.ride_by_precip

    erb :"conditions/dashboard"
  end
end
