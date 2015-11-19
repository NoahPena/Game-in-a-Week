local playerTwo = {x = 0, y = 0, speed = 100, isHolding = false}

--local joint

function playerTwo.update(dt, objects)

  --playerTwo.setPosition(love.mouse.getPosition())

  for i = 1, #objects do
    
    if objects[i].grabbed then
      print("updateGrabbed")
      --objects[i].joint:setTarget(love.mouse.getPosition())
      --objects[i].body:setPosition(love.mouse.getPosition())
      local x = select(1, love.mouse.getPosition()) - select(1, objects[i].body:getPosition())
      local y = select(2, love.mouse.getPosition()) - select(2, objects[i].body:getPosition())
      objects[i].body:setLinearVelocity(x * 25,y * 25)
      
    end
    
  end
  
  if love.mouse.isDown("l") then
    print("left")
    for i = 1, #objects do
      
      if objects[i].fixture:testPoint(love.mouse.getPosition()) then
        
        if objects[i].grabbed == false then
          
          --grab object
          objects[i].grabbed = true
          --objects[i].joint = love.physics.newMouseJoint(objects[i].body, love.mouse.getPosition())
        
        end
        
      end
      
    end
    
    print("finished")
    
  else
    
    for i = 1, #objects do
      print("not pressed")
      if objects[i].fixture:testPoint(love.mouse.getPosition()) and objects[i].grabbed then
        
        objects[i].grabbed = false
        objects[i].body:setLinearVelocity(0, 0)
        --objects[i].joint:destroy()
        --objects[i].joint = nil
        
      end
      
    end
    
  end
  
end

function playerTwo.draw()
  
 -- love.graphics.circle("fill", playerTwo.x, playerTwo.y, 10)
  
  love.graphics.print("X: "..tostring(playerTwo.x).."\nY: "..tostring(playerTwo.y), 100, 100)
  
end

function playerTwo.setPosition(x,y)
  
  playerTwo.x = x
  playerTwo.y = y
  
end

function playerTwo.getPosition()
  
  return playerTwo.x,playerTwo.y
  
end

function playerTwo.getX()
  
  return playerTwo.x
  
end

function playerTwo.getY()
  
  return playerTwo.y
  
end

return playerTwo