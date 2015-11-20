levelThree = {}

local keyboardPlayer = require("playerOne")
local mousePlayer = require("playerTwo")

local world, objects, pickupableObjects

function levelThree.load(arg)
  
  world = love.physics.newWorld(0, 9.81 * 1000, true)
  
  pickupableObjects = {}
  
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
  
end

function levelThree.draw()
  
end