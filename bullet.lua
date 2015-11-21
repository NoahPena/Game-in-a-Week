--bullet = {x = 0, y = 0, radius = 2, speed = 200, direction = "right"}

bullet = {}

bulletList = {}



function bullet.create(x1,y1, direction1)
  
  --[[Bullet = {}
  Bullet.x = x
  Bullet.y = y
  Bullet.radius = 2
  Bullet.speed = 200
  Bullet.direction = direction]]
  
  table.insert(bulletList, {x = x1, y = y1, radius = 2, speed = 200, direction = direction1})
  
end

function bullet.update(dt, buttons)
  
  print(tostring(#bulletList))
  
  local length = #bulletList
  
  for i = #bulletList, 1, -1 do
    
    for j = 1, #buttons do
      if bullet.TestButtonCollision(bulletList[j].x, bulletList[j].y, bulletList[j].radius, buttons[j].x, buttons[j].y, buttons[j].radius) then
        
        buttons[j].isPressed = true
        print("wow")
        
      end
    end
    print("length: "..tostring(#bulletList))
    print("i: "..tostring(i))
    print(bulletList[i])
    if bulletList[i].direction == "right" then
      
      if bulletList[i].x > love.window.getWidth() then
        
        table.remove(bulletList, i)
      
      else
        
        bulletList[i].x = bulletList[i].x + (bulletList[i].speed * dt)
        
      end
      
    elseif bulletList[i].direction == "left" then
      
      if bulletList[i].x < 0 then
        
        table.remove(bulletList, i)
        
      else
      
        bulletList[i].x = bulletList[i].x - (bulletList[i].speed * dt)
      
      end
      
    elseif bulletList[i].direction == "up" then
      
      if bulletList[i].y < 0 then
        
        table.remove(bulletList, i)
        
      else
      
        bulletList[i].y = bulletList[i].y - (bulletList[i].speed * dt)
        
      end
      
    end
    
    
  end
  
end

function bullet.TestButtonCollision(x1, y1, radius1, x2, y2, radius2)
  
  return CheckCollision(x1 - radius1, y1 - radius1, radius1 * 2, radius1 * 2, x2 - radius2, y2 - radius2, radius2 * 2, radius2 * 2)
  
end

function bullet.draw()
  
  for i = 1, #bulletList do
  
    love.graphics.circle("fill", bulletList[i].x, bulletList[i].y, bulletList[i].radius)
    
  end
  
end