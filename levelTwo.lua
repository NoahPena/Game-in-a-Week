levelTwo = {}

local keyboardPlayer = require("playerOne")
local mousePlayer = require("playerTwo")


local world, objects, pickupableObjects

function levelTwo.load(arg)
  
  world = love.physics.newWorld(0, 9.81 * 1000, true)
  
  pickupableObjects = {}
  
  --ground shit
  objects = {}
  objects.groundOne = {}
  objects.groundOne.body = love.physics.newBody(world, 0, 600-75/2, "static")
  objects.groundOne.shape = love.physics.newRectangleShape(700, 75)
  objects.groundOne.fixture = love.physics.newFixture(objects.groundOne.body, objects.groundOne.shape)
  
  objects.groundTwo = {}
  objects.groundTwo.body = love.physics.newBody(world, 700, 200, "static")
  objects.groundTwo.shape = love.physics.newRectangleShape(200, 25)
  objects.groundTwo.fixture = love.physics.newFixture(objects.groundTwo.body, objects.groundTwo.shape)
  
  --objects.groundThree = {}
  --objects.groundThree.body = love.physics.newBody(world, 
  
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
  
  --block shit
  objects.blockOne = {}
  objects.blockOne.body  = love.physics.newBody(world, 200, (600 - 75/2) - 50, "kinematic")
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
  objects.endzone.body = love.physics.newBody(world, 750, 150 + 25, "static")
  objects.endzone.shape = love.physics.newRectangleShape(25, 25)
  objects.endzone.fixture = love.physics.newFixture(objects.endzone.body, objects.endzone.shape)
  
  keyboardPlayer.create(world)
  
  keyboardPlayer.setPosition(5, 50)
  
  love.graphics.setBackgroundColor(104, 136, 248)
  
end

function levelTwo.update(dt)
  
  currentObjects = pickupableObjects
  
  world:update(dt)
  local status = keyboardPlayer.update(dt)
  mousePlayer.update(dt, pickupableObjects)
  
  local a,b = keyboardPlayer.getPosition()
  local c,d = keyboardPlayer.getDimensions()
  local e,f = objects.endzone.body:getPosition()
  local g,h = objects.endzone.getDimensions()
  
  if status == false then
    
    world:destroy()
    currentObjects = nil
    levelTwo.load("nigga")
    
  end
  
  --print(a,b,c,d,e,f,g,h)
  
  if CheckCollision(a,b,c,d,e,f,g,h) then
    
    world:destroy()
    currentObjects = nil
    state = "levelThree"
    levelThree.load("nigga")
    print("we made it")
    
  end
  
end

function levelTwo.draw()
  
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
  
  --draw collisions
  love.graphics.setColor(13, 37, 69)
  love.graphics.polygon("line", objects.endzone.body:getWorldPoints(objects.endzone.shape:getPoints()))
  
  --draw blocks
  love.graphics.setColor(25, 25, 25)
  
  love.graphics.polygon("fill", objects.blockOne.body:getWorldPoints(objects.blockOne.shape:getPoints()))
  
  
  love.graphics.setColor(255, 255, 255)
  
end