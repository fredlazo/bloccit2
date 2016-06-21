require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
    describe "GET faq" do
      it 'renders the FAQ template' do
      get :faq
      expect(response).to render_template("faq")
    end
  end
end
