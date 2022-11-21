require 'spec_helper'
require 'rack/test'
require_relative '../../app'


describe Application do 
    #This is so we can use rack-test helper methods.
    include Rack::Test::Methods

    # We need to declare the 'app' value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }

    context "Get to /" do
        it "contains a h1 title" do
            response = get('/')
            expect(response.body).to include ('<h1>Hello</h1>')
        end
        it 'contains a div' do
            response = get('/')
            expect(response.body).to include('<div>')


        end
    end

    context "GET /hello" do
        it 'contains Hello title' do
            response = get("/hello")

            expect(response.body).to include("Hello!")


        end

    end
    
end