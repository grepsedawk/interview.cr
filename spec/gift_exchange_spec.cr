require "./spec_helper"

Spectator.describe Interview::GiftExchange do
  subject(:gift_exchange) do
    Interview::GiftExchange.new(
      <<-CSV
    Chris,chris@example.com
    Felix,felix@example.net
    Elizabeth,lizzy1994@example.com
    André,andre@example.fr
    Milo,milo.milo@example.com
    Olivia,olive99@example.net
    Hugo,hugo124@example.net
    Amit,amit.123@example.com
    Ludwig,ludwig@example.net
    Raoul,raoul@example.com
   CSV
    )
  end

  it do
    expect(gift_exchange.people.size).to eq(10)
    expect(gift_exchange.people.map(&.name)).to contain_exactly(
      "Chris",
      "Felix",
      "Elizabeth",
      "André",
      "Milo",
      "Olivia",
      "Hugo",
      "Amit",
      "Ludwig",
      "Raoul"
    )

    expect(gift_exchange.people.map(&.email)).to contain_exactly(
      "chris@example.com",
      "felix@example.net",
      "lizzy1994@example.com",
      "andre@example.fr",
      "milo.milo@example.com",
      "olive99@example.net",
      "hugo124@example.net",
      "amit.123@example.com",
      "ludwig@example.net",
      "raoul@example.com",
    )

    expect(gift_exchange.gifts.size).to eq(10)
    expect(gift_exchange.gifts.map(&.to.name)).to contain_exactly(
      "Chris",
      "Felix",
      "Elizabeth",
      "André",
      "Milo",
      "Olivia",
      "Hugo",
      "Amit",
      "Ludwig",
      "Raoul"
    )
    expect(gift_exchange.gifts.map(&.from.name)).to contain_exactly(
      "Chris",
      "Felix",
      "Elizabeth",
      "André",
      "Milo",
      "Olivia",
      "Hugo",
      "Amit",
      "Ludwig",
      "Raoul"
    )

    # stub random seed

    gift_exchange.gifts.each do |gift|
      expect(gift.to.email).not_to eq(gift.from.email)
    end
  end
end
