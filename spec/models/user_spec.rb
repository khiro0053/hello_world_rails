require 'rails_helper'
require "pry"

RSpec.describe User, type: :model do
  context "acountを指定しているとき" do
    it "ユーザーが作られる" do
      user = create(:user)

      expect(user).to be_valid
    end
  end

  context "acountが指定されていない場合" do
    it "エラーする" do
      user = build(:user,account: nil)
      user.valid?

      expect(user.errors.messages[:account]).to include "can't be blank"
    end
  end
  context "同名の account が存在するとき" do
    it "エラーする" do

      create(:user,account:"kaneko")
      user = build(:user,account:"kaneko")
      user.valid?
      expect(user.errors.messages[:account]).to include "has already been taken"
    end
   end
end