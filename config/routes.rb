Rails.application.routes.draw do
  root "top#index"  # `/` の時にtop/index にルーティング
  get "about" => "top#about", as: "about"  # ルーティングにget を使用する　topContoroller の about を呼び出し 

  1.upto(18) do |n|
    get "lesson/step#{n}(/:name)" => "lesson#step#{n}"
  end
end
