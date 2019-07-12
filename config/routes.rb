Rails.application.routes.draw do
  
  devise_for :users
  root 'articles#index' # 一覧画面
  get   'articles/new'  =>  'articles#new'  #投稿画面
  post  '/articles'      =>  'articles#create'    #ツイート投稿機能
  delete '/:id' => 'articles#destroy' #削除機能
  get   'users/:id'   =>  'users#show'    #Mypageへのルーティング
  delete  'articles/:id'  => 'articles#destroy'
  get   '/articles/:id/edit'  => 'articles#edit'
  patch   '/articles/:id'  => 'articles#update'

end
