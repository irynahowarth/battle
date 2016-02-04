def sign_in_and_play
  visit '/'
  fill_in('player1_name', with: 'Iryna')
  fill_in('player2_name', with: 'Barry')
  click_button('Submit')
end

def attack_and_back_to_game
  click_link('Attack')
  click_link('Back to game')
end