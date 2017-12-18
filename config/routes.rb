Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions', registrations: 'users/registrations'
      }

    resources :questions
      resources :answers
      resources :exams do
    collection do 
      get :mark_as_correct_answer
    end
 end
  root 'home#index'

   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
