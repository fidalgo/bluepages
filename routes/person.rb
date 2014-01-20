require 'sinatra/base'
require 'json'

module Sinatra
  module Persons

    def self.registered(app)

      app.get '/company/:id/owners' do
        company = Company.find(params[:id])
        company.owners.to_json
      end

      app.post '/company/:id/owners' do
        params_json = JSON.parse(request.body.read)
        person = Person.new(params_json)
        company = Company.find(params[:id])
        company.owners.push(person)
        company.save!
        company.owners.to_json
      end

      app.delete '/company/:id/owners/:ownerid' do
        company = Company.find(params[:id])
        company.owners.delete(params[:owerid])
        company.owners
      end

      app.get '/company/:id/directors' do
        company = Company.find(params[:id])
        company.directors.to_json
      end

      app.post '/company/:id/directors' do
        params_json = JSON.parse(request.body.read)
        person = Person.new(params_json)
        company = Company.find(params[:id])
        company.directors.push(person)
        company.save!
        company.directors.to_json
      end

      app.delete '/company/:id/directors/:directorid' do
        company = Company.find(params[:id])
        company.directors.delete(params[:directorid])
        company.directors
      end
    end

  end
  register Persons
end
