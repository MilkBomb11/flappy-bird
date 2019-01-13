Pipe = Object:extend()

function Pipe:new(x, y1, y2, w, h)
  self.x = x
  self.y1 = y1
  self.y2 = y2
  self.w = w
  self.h = h
end

function Pipe:move(speed, dt)
  self.x = self.x - speed*dt
end

function Pipe:display()
  love.graphics.setColor(1, 1, 98/255)
  love.graphics.rectangle("line", self.x, self.y1, self.w, self.h)
  love.graphics.rectangle("line", self.x, self.y2, self.w, self.h)
end
