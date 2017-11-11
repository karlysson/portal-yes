Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  mount Ckeditor::Engine => '/ckeditor'

  ########################
  #PUBLIC
  ########################
  get 'users'               => "sessions#new"
  get 'vagas'               => 'page#vagas'
  get 'quem-somos'          => 'page#quem_somos'
  get 'planos'              => 'page#planos'
  get 'empresas'            => 'page#empresas'
  get 'localizacao'         => 'page#localizacao'
  get 'consultoria'         => 'page#consultoria'
  get 'consultoria-empresa' => 'page#consultoria_empresa'
  get 'consultoria-empresa' => 'page#consultoria_empresa'
  get 'eja'                 => 'page#eja'
  get 'anuncios'            => 'anuncio#index'
  get '/anuncio/:id', to: 'anuncio#show'
  get 'contatos'            => 'contacts#index'
  resources :contacts
  # resources :contacts, only: [:index, :new, :show]

  ########################
  #ADMIN
  ########################
  namespace :admin do
    root 'home#index'
    
    # Banner
    resources :banners
    # Anúncio
    resources :advertisings
    resources :advertising_categories
    # Empresa
    resources :companies
    resources :company_categories
    resources :company_category_relationships
    # Vagas
    resources :jobs
    resources :job_interations
    # Curriculum
    resources :curriculums
    resources :curriculum_offices
    resources :curriculum_categories
    resources :curriculum_profiles
    resources :references
    resources :indications
    # Cursos
    resources :courses
    resources :course_categories
    resources :course_interations
    ####Conf####
    #Cidade
    resources :cities
    resources :states
    #Usuario
    resources :users
    resources :permissions, only: [:index]
    # DER
    resources :diagrams, only: [:index]
    # Contact
    resources :contacts
    # Paginas
    resources :pages
  end
end
