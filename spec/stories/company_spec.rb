require 'carrierwave/test/matchers'
require_relative "../story_helper.rb"

describe "CompaniesStory" do

  describe "POST /company" do 
    before do 
      post"/company", {
        company: {
          name: "Google",
          address: "Google Street, 1",
          city: "Google city",
          country: "Google country",
          email: "google@google.com",
          phone: "+1000000000001"
        }
      }, {'Content-Type' => 'application/json'}

    end

    it {last_response.status.must_equal 200}

  end

  describe "GET /company" do
    before do
      get "/company"
    end

    it "responds sucessfully" do
      last_response.status.must_equal 200
    end
  end

  describe "GET /company/:id" do

    before do
      @company = FactoryGirl.create :company
      get "/company/#{@company.id}"
    end

    let(:json) { JSON.parse(last_response.body) }
    it{json['name'].must_equal @company.name}
    it{json['city'].must_equal @company.city}
    it{json['address'].must_equal @company.address}
    it{json['email'].must_equal @company.email}

  end

  describe "PUT /company/:id" do

    before do
      @company = FactoryGirl.create :company
      put "/company/#{@company.id}",{ company: {"name" => "Updated Cool name"} }
    end
    it {last_response.status.must_equal 202}
  end

  describe "DELETE /company/:id" do
    before do
      @company = FactoryGirl.create :company
      delete "/company/#{@company.id}"
    end
    it{last_response.status.must_equal 202}
  end

  describe 'GET /company/:id/owners' do
    before do
      @company = FactoryGirl.create :company
      get "/company/#{@company.id}/owners"
    end
    it {last_response.status.must_equal 200}
    it{puts last_response.body}
  end

  describe 'POST /company/:id/owners' do
    before do
      DocumentUploader.enable_processing = true
      @document = DocumentUploader.new(@person, :document)
      @document.store!(File.open('/tmp/bitcoin.pdf'))
      @company = FactoryGirl.create :company
      @person = Person.new
      @person.name = "Bit Master"
      @person.document = @document
      @company.owners.push @person
      @company.save!
      get "/company/#{@company.id}/owners"
    end

    it{puts last_response.body}

    it{puts @company.owners.size}
    after do
      DocumentUploader.enable_processing = false
      @document.remove!
    end
  end

end
