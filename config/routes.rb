Api::Application.routes.draw do
  post "push/android"
  get "push/ios"
	post "push/ios"
  post "auth/LoginByTokenFromMobile"
  post "auth/LoginByUserFromMobile"
	post "auth/Logout"
	match "business_details/readlist" => "business_details#readList", :via => :get
	match "business_details/readmap" => "business_details#readMap", :via => :get
	#match "business_details/BusinessDetail" => "business_details#businessDetail", :via => :post

	match "auth/LoginByFacebook" => "auth#LoginByFacebookFromMobile", :via => :post
	match "auth/CreateQrcodeFromMobile" => "auth#CreateQrcodeFromMobile", :via => :post
	match "auth/RegisterQrcodeFromMobile" => "auth#RegisterQrcodeFromMobile", :via => :post
	match "auth/CreateC2DMDevice" => "auth#CreateC2DMDevice", :via => :post
	match "auth/LoginByBusinessFromMobile" => "auth#LoginByBusinessFromMobile", :via => :post

	match "donation/MakeDonation" => "donation#MakeDonation", :via => :post

	match "stats/UserTotalDonation"=>"stats#UserTotalDonation", :via => :post
	match "stats/UserDonationByCharity"=>"stats#UserDonationByCharity", :via => :post
	match "stats/UserDonationByPlace"=>"stats#UserDonationByPlace", :via => :post
	match "stats/BusinessTodayCount"=>"stats#BusinessTodayCount", :via => :post
	match "stats/BusinessAccountDetail"=>"stats#BusinessAccountDetail", :via => :post
	match "stats/BusinessStatsDaily"=>"stats#BusinessStatsDaily", :via => :post
	match "stats/BusinessStatsWeekly"=>"stats#BusinessStatsWeekly", :via => :post
	match "stats/BusinessStatsMonthly"=>"stats#BusinessStatsMonthly", :via => :post
	match "stats/CharityDonation"=>"stats#CharityDonation", :via => :post
	match "stats/ThankyouDetail"=>"stats#ThankyouDetail", :via => :post
	match "stats/ThankyouDetail"=>"stats#ThankyouDetail", :via => :get
	match "stats/UnreadNotifications"=>"stats#UnreadNotifications", :via => :get

	match "log/CreateSNSLog"=>"log#CreateSNSLog", :via => :post

	match "charity_details/GetCharityLatest"=>"charity_details#GetCharityLatest", :via => :post

	#Redirection
	#match "/media/qrcode/:name" => redirect{|params| "https://s3.amazonaws.com/BG_DEV_S3/media/qrcode/#{params[:name]}.png"}

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
