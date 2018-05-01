Rails.application.routes.draw do
  devise_for :lawyers, controllers:{
    sessions: 'lawyers/sessions',
    registrations: 'lawyers/registrations'
  },
  path:"/",
  path_names:{registration: 'advogado',
              sign_up: '/cadastro'
  }
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    },
    path: "/",
    path_names: { sign_in: 'login',
                  sign_out: 'logout',
                  registration: 'usuario',
                  sign_up: '/cadastro' ,
                }
    devise_scope :user do
      authenticated :user do
    get '/perfil' => 'landing_page#perfil', as: :perfil
    get "perfil" => "landing_page#edit"
    put "avatar" => "landing_page#update"
    get 'advogado/match' => 'landing_page#match_lawyer'
      end
    end
  root to: 'landing_page#index'
  # root to: "home#index"
end
