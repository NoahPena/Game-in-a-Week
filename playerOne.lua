local playerOne = {x = 0, y = 0, width = 25, height = 25, speed = 100, health = 3}

function playerOne.create(world)
  
  playerOne.box = {}
  playerOne.box.body = love.physics.newBody(world, playerOne.x, playerOne.y, "dynamic")
  playerOne.box.shape = love.physics.newRectangleShape(0, 0, playerOne.width, playerOne.height)
  playerOne.box.fixture = love.physics.newFixture(playerOne.box.body, playerOne.box.shape, 5)
  
  playerOne.box.body:setSleepingAllowed(false)
  playerOne.box.body:setLinearDamping(.1)
  playerOne.box.body:setFixedRotation(true)
  --playerOne.box.body:setMass(100)
  
  playerOne.box.fixture:setFriction(1)
  playerOne.box.fixture:setDensity(100)
  playerOne.box.fixture:setRestitution(0)
  
end

function playerOne.update(dt)
  
  --playerOne.box.body:applyForce(0, 4000000)
  
  if select(2, playerOne.box.body:getPosition()) >= love.window.getHeight() then
    
    print("dead")
    return false
    
  end
  
  if love.keyboard.isDown("a") then
    
    if (playerOne.box.body:getX() - (playerOne.speed * dt)) > 0 then
      
      playerOne.box.body:setX(playerOne.box.body:getX() - (playerOne.speed * dt))
    
    end
    
  end
  
  if love.keyboard.isDown("d") then
    
    
    if (playerOne.box.body:getX() + (playerOne.speed * dt)) < love.window.getWidth() then
      
      playerOne.box.body:setX(playerOne.box.body:getX() + (playerOne.speed * dt))
    
    end
    
  end
  
  if love.keyboard.isDown("space") then
    
    --shoot
    print("nigga")
    
  end
  
  return true
  
end

function playerOne.draw()
  
  love.graphics.polygon("line", playerOne.box.body:getWorldPoints(playerOne.box.shape:getPoints()))
  
  love.graphics.print("PlayerX: "..tostring(playerOne.getX()).."\nPLayerY: "..tostring(playerOne.getY()), 200, 100)
  
end

function playerOne.setPosition(x, y)
  
  playerOne.box.body:setX(x)
  playerOne.box.body:setY(y)
  
end

function playerOne.getPosition()
  
  return playerOne.box.body:getPosition()
  
end

function playerOne.getX()
  
  return playerOne.box.body:getX()
  
end

function playerOne.getY()
  
  return playerOne.box.body:getY()
  
end

function playerOne.getDimensions()
  
  return playerOne.width, playerOne.height
  
end

return playerOne