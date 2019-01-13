Bird = Object:extend()

function Bird:new(x, y, r)
  self.x = x
  self.y = y
  self.yv = 0
  self.r = r
end

function Bird:gravity(grv, dt)
  self.yv = self.yv + grv*dt
  self.y = self.y + self.yv
end

function Bird:jump(jump)
  self.yv = -jump
end

function Bird:display()
  love.graphics.setColor(240/255, 141/255, 200/255)
  love.graphics.circle("line", self.x, self.y, self.r)
end
