require("levelOne")
require("levelTwo")
require("levelThree")
require("levelFour")
require("bossFight")
require("mainMenu")

--state = "levelOne"

--state = "levelTwo"
--state = "levelThree"
--state = "levelFour"
--state = "bossFight"
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
    
  elseif state == "levelThree" then
    
    levelThree.load(arg)
    
  elseif state == "levelFour" then
    
    levelFour.load(arg)
    
  elseif state == "bossFight" then
    
    bossFight.load(arg)
  
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
    
  elseif state == "levelThree" then
    
    levelThree.update(dt)
    
  elseif state == "levelFour" then
    
    levelFour.update(dt)
    
  elseif state == "bossFight" then
    
    bossFight.update(dt)
    
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
    
  elseif state == "levelThree" then
    
    levelThree.draw()
    
  elseif state == "levelFour" then
    
    levelFour.draw()
    
  elseif state == "bossFight" then
    
    bossFight.draw()
    
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

function beginContact(a, b, coll)
 
end
 
function endContact(a, b, coll)
 
end
 
function preSolve(a, b, coll)
 
end
 
function postSolve(a, b, coll, normalimpulse1, tangentimpulse1, normalimpulse2, tangentimpulse2)
 
end