require "rails_helper"

describe "As a User" do
  describe "When I visit a specific vending machine page" do
    scenario "I see the name of all snacks associated with that vending machine" do
      owner = Owner.create!(name: "Nikhil")
      vending = owner.machines.create!(location: "Denver")
      snack = Snack.create!(name: "Mars", price: 100)
      Machinesnack.create!(machine: vending, snack: snack)
      visit machine_path(vending)

      expect(page).to have_content("Mars")
    end

    scenario "I see the price of all snacks associated with that vending machine" do
      owner = Owner.create!(name: "Nikhil")
      vending = owner.machines.create!(location: "Denver")
      snack = Snack.create!(name: "Mars", price: 200)
      Machinesnack.create!(machine: vending, snack: snack)
      visit machine_path(vending)
      visit machine_path(vending)

      expect(page).to have_content("$2.00")
    end
  end
end
