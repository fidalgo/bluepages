require 'sinatra/base'
require 'json'

module Sinatra
  module Companies

    def self.registered(app)

      #Create a new company
      app.post '/company' do
        company = Company.new(params['company'])
        company.save
        status 201
      end

      #List all companies
      app.get '/company' do
        Company.all.to_json
      end

      #Get the details about one company
      app.get '/company/:id' do
        puts "GET with params #{params.inspect}"
        company = Company.find(params[:id])
        return status 404 if company.nil?
        company.to_json
      end

      #Update a company
      app.put 'company/:id' do
        puts "PUT with params #{params.inspect}"
        company = Company.find(params[:id])
        return status 404 if company.nil?
        company.update(params[:company])
        company.save
        status 202
      end

      #Delete a company
      app.delete 'company/:id' do
        puts "DELETE with params #{params.inspect}"
        company = Company.find(params[:id])
        return status 404 if company.nil?
        company.delete
        status 202
      end

      #TODO: Attach the pdf files for ownwers and directors
      #
    end
  end
  register Companies
end
