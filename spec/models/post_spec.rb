require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "hast title and body attributes" do
      expect(post).to have_attributes(title: post.title, body: post.body)
    end
  end

end
