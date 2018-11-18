Rails.application.routes.draw do
  get '/about', :to => redirect('/about.html')
  get '/author', :to => redirect('/author.html')
end
