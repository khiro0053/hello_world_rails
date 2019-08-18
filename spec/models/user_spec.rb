require 'rails_helper'
require "pry"

RSpec.describe User, type: :model do
  context "acountを指定しているとき" do
    it "ユーザーが作られる" do
      user = User.new(name:"kaneko", account: "kaneko", email:"kaneko@example.com")
      expect(user).to be_valid
    end
  end
  context "acountが指定されていない場合" do
    it "エラーする" do
      user = User.new(name:"kaneko", account: nil, email:"kaneko@example.com")
      user.valid?


      expect(user.errors.messages[:account]).to include "can't be blank"
    end
  end
  context "同名の account が存在するとき" do
    it "エラーする" do

      User.create!(name:"kaneko", account: "kaneko", email:"kaneko@example.com")
      user = User.new(name:"kaneko2", account: "kaneko", email:"kaneko2@example.com")
      user.valid?
      expect(user.errors.messages[:account]).to include "has already been taken"
    end
   end
end