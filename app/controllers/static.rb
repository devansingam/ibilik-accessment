get '/' do
  @biliks = Bilik.all
  erb :"static/index"

end