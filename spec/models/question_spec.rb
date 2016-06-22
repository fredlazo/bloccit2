require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: "Title", body: "Body", resolved: true)}
  let(:question) {Question.create!(title: "Title", body: "Body", resolved: true)}

  describe "attributes" do
    it "has title, body and resolved attributes" do
      expect(question).to have_attributes(title: "Title", body: "Body", resolved: true)
    end
  end

end
