function Initialization() --This function resets pipes, bird, and score for another round
  objects = {}
  objects.bird = Bird(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 15)
  objects.pipes = {}
  score = 0
end


function love.load() -- Called one at the start
  love.window.setMode(400, 600)
  love.window.setTitle("Flappy Bird")

  --requiring libs--
  Object = require "Libs.classic"
  ----

  --requiring objecbts--
  require "Objects.Bird"
  require "Objects.Pipe"
  ----

  --requiring scenes--
  require "GameScenes.game"
  require "GameScenes.gameover"
  ----

  --setting up objects--
  Initialization()
  ----

  --variables--
  pipeInterval = 150 --space between pipes in a set of pipes
  pipeSpawnTime = 2 --pipe spawn cool time
  currentTime = 0 --current time to know if it's time to spawn another pipe

  gameScene = "game" -- variable that will handle the flow of the program
  ----
end

function love.update(dt) -- called every frame
  if gameScene == "game" then --if scene is game
    gameUpdate(dt) -- call function gameUpdate which is located in GameScenes/game.lua
  end --else do nothing
end

function love.draw() --called every frame
  if gameScene == "game" then --if scene is game
    gameDisplay() -- call function gameDisplay which is located in GameScenes/game.lua
  elseif gameScene == "gameOver" then --else if scene is game over 
    gameoverDisplay() -- call function gameoverDisplay which is located in GameScenes/gameover.lua
  end
end

function love.keypressed(key, scancode, isrepeat) -- called whenever a key is pressed
  if gameScene == "game" then -- if scene is game
    gameInput(key) -- call function gameInput which is located in GameScenes/game.lua
  elseif gameScene == "gameOver" then -- else if scene is game over
    gameoverInput(key) -- call function gameoverInput which is located in GameScenes/gameover.lua
  end
end
