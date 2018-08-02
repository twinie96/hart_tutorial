require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:mail) { UserMailer.account_activation(user) }
    let(:user) { create(:user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body with activation link" do
      expect(mail.body.encoded).to include("http://localhost:3000#{edit_account_activation_path(user.activation_token, email: user.email)}")
    end
  end

  # describe "password_reset" do
  #   let(:mail) { UserMailer.password_reset }
  #
  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Password reset")
  #     expect(mail.to).to eq(["to@example.org"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end
  #
  #   it "renders the body" do
  #     expect(mail.body.encoded).to match("Hi")
  #   end
  # end

end