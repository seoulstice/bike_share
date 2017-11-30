class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/stations' do
    @stations = Station.all

    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
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
end
