require "rails_helper"

describe "As a User" do
  describe "When I visit the snack/:id page" do
    scenario "I can see details for that snack" do
      owner = Owner.create!(name: "Nikhil")
      vending = owner.machines.create!(location: "Denver")
      snack_1 = Snack.create!(name: "Mars", price: 200)
      snack_2 = Snack.create!(name: "Popcorn", price: 300)
      Machinesnack.create!(machine: vending, snack: snack_1)
      Machinesnack.create!(machine: vending, snack: snack_2)

      visit snack_path(snack_1)

      expect(page).to have_content("Mars")
      expect(page).to have_content("$2.00")
      expect(page).to have_content("Denver")
    end
  end
end
