  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  feature "Player see oponent's Hit Points" do
    scenario "allow to see player's 2 Hit Pounts" do
      sign_in_and_play
      expect(page).to have_content("Barry: 60 HP")
    end
  end

  # As Player 1,
  # So I can see how close I am to losing,
  # I want to see my own hit points
  feature "Player see it's own Hit Points" do
    scenario "allow to see player's own Hit Pounts" do
      sign_in_and_play
      expect(page).to have_content("Iryna: 60 HP")
    end
  end

  # As a Player,
  # So I can Lose a game of Battle,
  # I want to see a 'Lose' message if I reach 0HP first
  feature "Lose a game" do
    scenario "Player see Lose message if 0 HP reached" do
      sign_in_and_play
      10.times{attack_and_back_to_game}
      click_link('Attack')
      expect(page).to have_content("Game over! Barry lost this game.")
    end
  end