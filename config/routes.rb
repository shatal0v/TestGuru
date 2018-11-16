Rails.application.routes.draw do
  controller :pages do
    get :about
    get :author
  end
end
