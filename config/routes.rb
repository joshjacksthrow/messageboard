Rails.application.routes.draw do
  resources :questions do 
    resources :answers
  end

  get '/', to: redirect('/questions')
end
