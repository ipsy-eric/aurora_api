AuroraApi::Application.routes.draw do
  resources :artists, only: [:index, :show, :create, :update, :destroy]
  resources :songs, only: [:index, :show, :create, :update, :destroy]
  resources :albums, only: [:index, :show, :create, :update, :destroy]
  resources :playlists, only: [:index, :show, :create, :update, :destroy]
  match 'albums/:album_id/songs/add' => 'albums#add_songs', :via => :post
  # -1 technically more restful if instead it this used the HTTP DELETE verb
  #    DELETE albums/:album_id/songs
  #        - pass song_ids to delete
  #        - pass no song_ids to delete all songs
  match 'albums/:album_id/songs/remove' => 'albums#remove_songs', :via => :post
  match 'playlists/:playlist_id/songs/add' => 'playlists#add_songs', :via => :post
  # 0 on later versions of Rails you can use this syntax:
  #   via: :post
  match 'playlists/:playlist_id/songs/remove' => 'playlists#remove_songs', :via => :post
end
