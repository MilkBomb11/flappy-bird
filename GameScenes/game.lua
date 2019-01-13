--functions for various reasons
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function spawnPipe(dt)
  if currentTime >= pipeSpawnTime then
    pipeY = love.math.random(-700, -400)
    table.insert(objects.pipes, Pipe(love.graphics.getWidth(), pipeY, pipeY+800+pipeInterval, 50, 800))
    currentTime = 0
  else
    currentTime = currentTime + dt
  end
end
----

--actual game code
function gameUpdate(dt)
  objects.bird:gravity(25, dt)
  spawnPipe(dt)
  for key, pipe in pairs(objects.pipes) do
    pipe:move(100, dt)
    if CheckCollision(objects.bird.x-objects.bird.r,objects.bird.y-objects.bird.r,objects.bird.r*2,objects.bird.r*2, pipe.x, pipe.y1, pipe.w, pipe.h) then
      gameScene = "gameOver"
    elseif CheckCollision(objects.bird.x-objects.bird.r,objects.bird.y-objects.bird.r,objects.bird.r*2,objects.bird.r*2, pipe.x, pipe.y2, pipe.w, pipe.h) then
      gameScene = "gameOver"
    end
    if pipe.x < 0-pipe.w then
      table.remove(objects.pipes, key)
      score = score + 1
    end
  end

  if objects.bird.y > love.graphics.getHeight() then
    gameScene = "gameOver"
  elseif objects.bird.y < 0 then
    gameScene = "gameOver"
  end

end

function gameDisplay()
  objects.bird:display()
  for key, pipe in pairs(objects.pipes) do
    pipe:display()
  end
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(tostring(score), love.graphics.getWidth()/2, 50, 0, 2, 2)
end

function gameInput(key)
  if key == "space" then
    objects.bird:jump(8)
  end
end
