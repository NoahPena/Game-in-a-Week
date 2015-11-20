levelThree = {}

local keyboardPlayer = require("playerOne")
local mousePlayer = require("playerTwo")

local world, objects, pickupableObjects, buttons

function levelThree.load(arg)
  
  world = love.physics.newWorld(0, 9.81 * 1000, true)
  
  pickupableObjects = {}
  
  buttons = {}
  
  --ground shit
  objects = {}
  objects.groundOne = {}
  objects.groundOne.body = love.physics.newBody(world, 0, 600 - 75/2, "static")
  objects.groundOne.shape = love.physics.newRectangleShape(400, 75)
  objects.groundOne.fixture = love.physics.newFixture(objects.groundOne.body, objects.groundOne.shape)
  
  objects.groundTwo = {}
  objects.groundTwo.body = love.physics.newBody(world, 700, 600 - 75/2, "static")
  objects.groundTwo.shape = love.physics.newRectangleShape(200, 25)
  objects.groundTwo.fixture = love.physics.newFixture(objects.groundTwo.body, objects.groundTwo.shape)
  
  --bound shit
  objects.boundOne = {}
  objects.boundOne.body = love.physics.newBody(world, 0 , 0, "static")
  objects.boundOne.shape = love.physics.newRectangleShape(25, 1200)
  objects.boundOne.fixture = love.physics.newFixture(objects.boundOne.body, objects.boundOne.shape)
  
  objects.boundTwo = {}
  objects.boundTwo.body = love.physics.newBody(world, 0, 0, "static")
  objects.boundTwo.shape = love.physics.newRectangleShape(1700, 25)
  objects.boundTwo.fixture = love.physics.newFixture(objects.boundTwo.body, objects.boundTwo.shape)
  
  objects.boundThree = {}
  objects.boundThree.body = love.physics.newBody(world, 800, 25, "static")
  objects.boundThree.shape = love.physics.newRectangleShape(25, 1200)
  objects.boundThree.fixture = love.physics.newFixture(objects.boundThree.body, objects.boundThree.shape)
  
  objects.boundFour = {}
  objects.boundFour.body = love.physics.newBody(world, 615, 25, "kinematic")
  objects.boundFour.shape = love.physics.newRectangleShape(25, 1200)
  objects.boundFour.fixture = love.physics.newFixture(objects.boundFour.body, objects.boundFour.shape)
  
  --button shit
  objects.button = {}
  objects.button.x = 387
  objects.button.y = 25
  objects.button.radius = 10
  objects.button.body = love.physics.newBody(world, objects.button.x, objects.button.y, "kinematic") 
  objects.button.shape = love.physics.newCircleShape(objects.button.radius)
  objects.button.fixture = love.physics.newFixture(objects.button.body, objects.button.shape)
  objects.button.isPressed = false
  buttons[1] = objects.button
  
  --block shit
  objects.blockOne = {}
  objects.blockOne.body = love.physics.newBody(world, 200, (600 - 75/2) - 50, "kinematic")
  objects.blockOne.shape = love.physics.newRectangleShape(200, 25)
  objects.blockOne.fixture = love.physics.newFixture(objects.blockOne.body, objects.blockOne.shape)
  objects.blockOne.grabbed = false
  objects.blockOne.body:setLinearDamping(.1)
  objects.blockOne.fixture:setFriction(1)
  objects.blockOne.fixture:setRestitution(0)
  pickupableObjects[1] = objects.blockOne
  
  --collision shit
  objects.endzone = {}
  objects.endzone.width = 25
  objects.endzone.height = 25
  objects.endzone.getDimensions = function()
    
                                    return objects.endzone.width, objects.endzone.height
    
                                end
  objects.endzone.body = love.physics.newBody(world, 750, 600 - 75/2 - 25, "static")
  objects.endzone.shape = love.physics.newRectangleShape(25, 25)
  objects.endzone.fixture = love.physics.newFixture(objects.endzone.body, objects.endzone.shape)
  
  keyboardPlayer.create(world)
  
  keyboardPlayer.setPosition(5, 50)
  
  love.graphics.setBackgroundColor(104, 136, 248)
  
end

function levelThree.update(dt)
  
  currentObjects = pickupableObjects
  
  world:update(dt)
  local status = keyboardPlayer.update(dt, buttons)
  mousePlayer.update(dt, pickupableObjects)
  
  local a,b = keyboardPlayer.getPosition()
  local c,d = keyboardPlayer.getDimensions()
  local e,f = objects.endzone.body:getPosition()
  local g,h = objects.endzone.getDimensions()
  
  if status == false then
    
    world:destroy()
    currentObjects = nil
    levelThree.load("nigga")
    --print("nigga")
    
  end
  
  if CheckCollision(a,b,c,d,e,f,g,h) then
    
    --world:destroy()
    --state = "levelFour"
    --levelFour.load("nigga")
    print("cool")
    
  end
  
  for i = 1, #buttons do
    
    if buttons[i].isPressed then
      
      print("nigga")
      
    end
    
  end
  
end

function levelThree.draw()
  
  keyboardPlayer.draw()
  mousePlayer.draw()
  
  --draw ground
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill", objects.groundOne.body:getWorldPoints(objects.groundOne.shape:getPoints()))
  love.graphics.polygon("fill", objects.groundTwo.body:getWorldPoints(objects.groundTwo.shape:getPoints()))
  
  --draw bounds
  love.graphics.setColor(69, 69, 69)
  love.graphics.polygon("fill", objects.boundOne.body:getWorldPoints(objects.boundOne.shape:getPoints()))
  love.graphics.polygon("fill", objects.boundTwo.body:getWorldPoints(objects.boundTwo.shape:getPoints()))
  love.graphics.polygon("fill", objects.boundThree.body:getWorldPoints(objects.boundThree.shape:getPoints()))
  love.graphics.polygon("fill", objects.boundFour.body:getWorldPoints(objects.boundFour.shape:getPoints()))
  
  --draw buttons
  love.graphics.setColor(255, 50, 15)
  love.graphics.circle("fill", objects.button.x, objects.button.y, objects.button.radius) 
  
  --draw collisions
  love.graphics.setColor(13, 37, 69)
  love.graphics.polygon("line", objects.endzone.body:getWorldPoints(objects.endzone.shape:getPoints()))
  
  --draw blocks
  love.graphics.setColor(25, 25, 25)
  
  love.graphics.polygon("fill", objects.blockOne.body:getWorldPoints(objects.blockOne.shape:getPoints()))
  
  
  love.graphics.setColor(255, 255, 255)
end