class BikeShareApp < Sinatra::Base
  get '/stations' do
    @stations = Station.all

    erb :"stations/index"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])

    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    erb :"station/edit"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations' do
    station = Station.create(params[:station])

    redirect :"station/#{station.id}"
  end

  put '/stations' do
    station = Station.update(params[:id], params[:station])

    redirect :"station/#{station.id}"
  end

  delete '/stations/:id' do
    # station = Station.find(params[:id])
    # station.destroy
    Station.destroy(params[:id])

    redirect :"stations/index"
  end
end
