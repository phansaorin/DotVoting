DotVoting::Application.routes.draw do
   resources :rounds do
   resources :posts 
   root to: "rounds#index"
 end
end
