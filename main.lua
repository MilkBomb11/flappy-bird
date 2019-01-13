function Initialization()
  objects = {}
  objects.bird = Bird(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 15)
  objects.pipes = {}
  score = 0
end


function love.load()
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
  pipeInterval = 150
  pipeSpawnTime = 2
  currentTime = 0

  gameScene = "game"
  ----
end

function love.update(dt)
  if gameScene == "game" then
    gameUpdate(dt)
  end
end

function love.draw()
  if gameScene == "game" then
    gameDisplay()
  elseif gameScene == "gameOver" then
    gameoverDisplay()
  end
end

function love.keypressed(key, scancode, isrepeat)
  if gameScene == "game" then
    gameInput(key)
  elseif gameScene == "gameOver" then
    gameoverInput(key)
  end
end
