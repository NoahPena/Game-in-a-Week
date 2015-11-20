--bullet = {x = 0, y = 0, radius = 2, speed = 200, direction = "right"}

bullet = {}

bulletList = {}



function bullet.create(x,y, direction)
  
  Bullet = {}
  Bullet.x = x
  Bullet.y = y
  Bullet.radius = 2
  Bullet.speed = 200
  Bullet.direction = direction
  
  table.insert(bulletList, Bullet)
  
end

function bullet.update(dt)
  
  for i = 1, #bulletList do
    
    if bulletList[i].direction == "right" then
      
      bulletList[i].x = bulletList[i].x + (bulletList[i].speed * dt)
      
    elseif bulletList[i].direction == "left" then
      
      bulletList[i].x = bulletList[i].x - (bulletList[i].speed * dt)
      
    elseif bulletList[i].direction == "up" then
      
      bulletList[i].y = bulletList[i].y - (bulletList[i].speed * dt)
      
    end
    
  end
  
end

function bullet.draw()
  
  for i = 1, #bulletList do
  
    love.graphics.circle("fill", bulletList[i].x, bulletList[i].y, bulletList[i].radius)
    
  end
  
end