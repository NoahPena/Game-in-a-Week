enemyBulletList = {}

enemyBullet = {}

function enemyBullet.create(x1, y1, direction1)
  
  table.insert(enemyBulletList, {x = x1, y = y1, radius = 2, speed = 300, direction = direction1})
  
end

function enemyBullet.update(dt, players)
  
  local destroy = false
  
  for i = #enemyBulletList, 1, -1 do
    
    for j = 1, #players do
      
      if TestBulletRectangleCollision(enemyBulletList[i].x, enemyBulletList[i].y, enemyBulletList[i].radius, select(1, players[j].body:getPosition()), select(2, players[j].body:getPosition()), players[j].width, players[j].height) then
        
        table.remove(enemyBulletList, i)
        
        if players[j].isPlayer then
          
          destroy = true
          
        end
        
        
        
      end
      
    end
    
    if enemyBulletList[i].direction == "e" then
      
      if enemyBulletList[i].x > love.window.getWidth() then
        
        table.remove(enemyBulletList, i)
        
      else
        
        enemyBulletList[i].x = enemyBulletList[i].x + (enemyBulletList[i].speed * dt)
        
      end
      
    elseif enemyBulletList[i].direction == "w" then
      
      if enemyBulletList[i].x < 0 then
        
        table.remove(enemyBulletList, i)
        
      else
        
        enemyBulletList[i].x = enemyBulletList[i].x - (enemyBulletList[i].speed * dt)
        
      end
      
    elseif enemyBulletList[i].direction == "n" then
      
      if enemyBulletList[i].y < 0 then
        
        table.remove(enemyBulletList, i)
        
      else
        
        enemyBulletList[i].y = enemyBulletList[i].y - (enemyBulletList[i].speed * dt)
        
      end
      
    elseif enemyBulletList[i].direction == "s" then
      
      if enemyBulletList[i].y > love.window.getHeight() then
        
        table.remove(enemyBulletList, i)
        
      else
        
        enemyBulletList[i].y = enemyBulletList[i].y + (enemyBulletList[i].speed * dt)
        
      end
      
    elseif enemyBulletList[i].direction == "nw" then
      
      if enemyBulletList[i].x < 0 or enemyBulletList[i].y < 0 then
        
        table.remove(enemyBulletList, i)
        
      else
        
        enemyBulletList[i].y = enemyBulletList[i].y - (enemyBulletList[i].speed * dt)
        enemyBulletList[i].x = enemyBulletList[i].x - (enemyBulletList[i].speed * dt)
        
      end
      
    elseif enemyBulletList[i].direction == "ne" then
      
      if enemyBulletList[i].x > love.window.getWidth() or enemyBulletList[i].y < 0 then
        
        table.remove(enemyBulletList, i)
        
      else
        
        enemyBulletList[i].x = enemyBulletList[i].x + (enemyBulletList[i].speed * dt)
        enemyBulletList[i].y = enemyBulletList[i].y - (enemyBulletList[i].speed * dt)
        
      end
      
    elseif enemyBulletList[i].direction == "se" then
      
      if enemyBulletList[i].x > love.window.getWidth() or enemyBulletList[i].y > love.window.getHeight() then
        
        table.remove(enemyBulletList, i)
        
      else
        
        enemyBulletList[i].x = enemyBulletList[i].x + (enemyBulletList[i].speed * dt)
        enemyBulletList[i].y = enemyBulletList[i].y + (enemyBulletList[i].speed * dt)
        
      end
      
    elseif enemyBulletList[i].direction == "sw" then
      
      if enemyBulletList[i].x < 0 or enemyBulletList[i].y > love.window.getHeight() then
      
        table.remove(enemyBulletList, i)
      
      else
      
        enemyBulletList[i].x = enemyBulletList[i].x - (enemyBulletList[i].speed * dt)
        enemyBulletList[i].y = enemyBulletList[i].y + (enemyBulletList[i].speed * dt)
      
      end
    
    end
  
  end

  if destroy then
    
    if state == "levelFour" then
      
      levelFour.destroy()
      
    end
    
  end
  
end

function enemyBullet.draw()
  
  for i = 1, #enemyBulletList do
    
    love.graphics.circle("fill", enemyBulletList[i].x, enemyBulletList[i].y, enemyBulletList[i].radius)
    
  end
  
end

function TestBulletRectangleCollision(x1, y1, radius, x2, y2, width, height)
  
  return CheckCollision(x1 - radius, y1 - radius, radius * 2, radius * 2, x2 - width/2, y2 - height/2, width, height)
  
end