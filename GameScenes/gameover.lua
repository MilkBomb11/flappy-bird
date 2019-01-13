function gameoverDisplay()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("Game Over", love.graphics.getWidth()/2, love.graphics.getHeight()/2)
  love.graphics.print("Press enter to restart", love.graphics.getWidth()/2, love.graphics.getHeight()/2 + 100)
  love.graphics.print(tostring(score), love.graphics.getWidth()/2, love.graphics.getHeight()/2+50)
end

function gameoverInput(key)
  if key == "return" then
    Initialization()
    gameScene = "game"
  end
end
