require("levelOne")
require("levelTwo")
require("mainMenu")

--state = "levelOne"

--state = "levelTwo"
--state = "test"
state = "mainMenu"

currentObjects = nil

function love.load(arg)

  if arg[#arg] == "-debug" then require("mobdebug").start() end
  io.stdout:setvbuf('no')

  love.physics.setMeter(64)
  
  if state == "levelOne" then
    
    levelOne.load(arg)
    
  elseif state == "levelTwo" then
    
    levelTwo.load(arg)
  
  elseif state == "mainMenu" then
  
    mainMenu.load(arg)
  
  end

  --levelOne.load(arg)
  --levelTwo.load(arg)

end

function love.update(dt)
  
  if state == "levelOne" then
    
    levelOne.update(dt)
    
  elseif state == "levelTwo" then
    
    levelTwo.update(dt)
    
  elseif state == "test" then
    
  
  elseif state == "mainMenu" then
  
    mainMenu.update(dt)
  
  end
  
end

function love.draw()
  
  if state == "levelOne" then
    
    levelOne.draw()
    
  elseif state == "levelTwo" then
    
    levelTwo.draw()
    
  elseif state == "test" then
    
  elseif state == "mainMenu" then
    
    mainMenu.draw()
    
  end
  
end

function love.mousepressed(x, y, mb)
  
  if mb == "wu" and currentObjects ~= nil then
    
    for i = 1, #currentObjects do
      
      if currentObjects[i].grabbed then
        
        currentObjects[i].body:setAngle(currentObjects[i].body:getAngle() + .2)
        
      end
      
    end
  
  elseif mb == "wd" and currentObjects ~= nil then
    
    for i = 1, #currentObjects do
      
      if currentObjects[i].grabbed then
        
        currentObjects[i].body:setAngle(currentObjects[i].body:getAngle() - .2)
        
      end
      
    end
  
  end
  
end