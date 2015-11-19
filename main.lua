require("levelOne")
require("levelTwo")

state = "levelOne"
--state = "test"

function love.load(arg)

  if arg[#arg] == "-debug" then require("mobdebug").start() end
  io.stdout:setvbuf('no')

  love.physics.setMeter(64)

  levelOne.load(arg)
  levelTwo.load(arg)
  
    world = love.physics.newWorld(0, 0)
    body = love.physics.newBody(world, love.mouse.getX(), love.mouse.getY(), "dynamic")
    shape = love.physics.newCircleShape(20)
    fixture = love.physics.newFixture(body, shape)
    joint = love.physics.newMouseJoint(body, love.mouse.getPosition())

end

function love.update(dt)
  
  if state == "levelOne" then
    
    levelOne.update(dt)
    
  elseif state == "levelTwo" then
    
    levelTwo.update(dt)
    
  elseif state == "test" then
    
    joint:setTarget(love.mouse.getPosition())
    world:update(dt)
    
  end
  
end

function love.draw()
  
  if state == "levelOne" then
    
    levelOne.draw()
    
  elseif state == "levelTwo" then
    
    levelTwo.draw()
    
  elseif state == "test" then
  
love.graphics.circle("fill", body:getX(), body:getY(), shape:getRadius())
    
  end
  
end