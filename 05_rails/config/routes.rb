require_relative '../lib/status_check_app'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount StatusCheckApp.new, at: "/status"
end
