require 'sinatra/base'
require 'json'

module Sinatra
  module Companies

    def self.registered(app)

      #Create a new company
      app.post '/company' do
        if params.empty?
          params_json = JSON.parse(request.body.read)
          company = Company.new(params_json)
        else
          company = Company.new(params['company'])
        end
        if company.save
          company.to_json
        else
          halt 500
        end
      end

      #List all companies
      app.get '/company' do
        Company.all.to_json
      end

      #Get the details about one company
      app.get '/company/:id' do
        company = Company.find(params[:id])
        return status 404 if company.nil?
        company.to_json
      end

      #Update a company
      app.put '/company/:id' do
        company = Company.find(params[:id])
        return status 404 if company.nil?
        company.update(params[:company])
        company.save
        status 202
      end

      #Delete a company
      app.delete '/company/:id' do
        company = Company.find(params[:id])
        return status 404 if company.nil?
        company.delete
        status 202
      end
    end
  end
  register Companies
end
