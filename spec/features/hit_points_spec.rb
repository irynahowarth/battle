  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  feature "Player's Hit Points" do
    scenario "allow to see player's 2 Hit Pounts" do
      sign_in_and_play
      expect(page).to have_content("Barry: 60 HP")
    end
  end