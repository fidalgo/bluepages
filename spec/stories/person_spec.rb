require 'carrierwave/test/matchers'
require_relative "../story_helper.rb"

describe "CompaniesStory" do

  # Owners
  describe 'GET /company/:id/owners' do
    before do
      @company = FactoryGirl.create :company
      get "/company/#{@company.id}/owners"
    end
    
    it {last_response.status.must_equal 200}
    let(:json) { JSON.parse(last_response.body) } 
    it{json.size.must_equal 0}
  end

  describe 'POST /company/:id/owners' do
    before do
      @document = DocumentUploader.new(@person, :document)
      @document.store!(File.open('spec/passport.pdf'))
      @company = FactoryGirl.create :company
      @person = Person.new
      @person.name = "John Doe owner"
      @person.document = @document
      post "/company/#{@company.id}/owners", @person.to_json
    end

    let(:json) { JSON.parse(last_response.body) } 
    it{json.size.must_equal 1}
    after do
      @document.remove!
    end
  end

  # Directors
  describe 'GET /company/:id/owners' do
    before do
      @company = FactoryGirl.create :company
      get "/company/#{@company.id}/directors"
    end
    it {last_response.status.must_equal 200}
    let(:json) { JSON.parse(last_response.body) } 
    it{json.size.must_equal 0}
  end

  describe 'POST /company/:id/directors' do
    before do
      @document = DocumentUploader.new(@person, :document)
      @document.store!(File.open('spec/passport.pdf'))
      @company = FactoryGirl.create :company
      @person = Person.new
      @person.name = "John Doe owner"
      @person.document = @document
      post "/company/#{@company.id}/directors", @person.to_json
    end

    let(:json) { JSON.parse(last_response.body) } 
    it{json.size.must_equal 1}
    after do
      @document.remove!
    end
end

end
