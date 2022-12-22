Rails.application.routes.draw do
  resources :questions do 
    resources :answers
    
    collection do
      post :purge
    end
  end

  get '/', to: redirect('/questions')
end
