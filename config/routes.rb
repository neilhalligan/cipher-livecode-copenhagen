Rails.application.routes.draw do
  root to: "super_cypher#home"
  get 'decypher', to: "super_cypher#decypher"
end
