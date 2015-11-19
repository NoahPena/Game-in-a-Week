levelOne = {}

local keyboardPlayer = require("playerOne")
local mousePlayer = require("playerTwo")


local world, objects, pickupableObjects

function levelOne.load(arg)
  
  --world = love.physics.newWorld(0, 0, true)
  world = love.physics.newWorld(0, 9.81 * 1000, true)
  
  pickupableObjects = {}
  
  --ground shit
  objects = {}
  objects.groundOne = {}
  objects.groundOne.body = love.physics.newBody(world, 0, 600-50/2, "static")
  objects.groundOne.shape = love.physics.newRectangleShape(600, 50)
  objects.groundOne.fixture = love.physics.newFixture(objects.groundOne.body, objects.groundOne.shape)
  
  objects.groundTwo = {}
  objects.groundTwo.body = love.physics.newBody(world, 900, 600 - 50/2, "static")
  objects.groundTwo.shape = love.physics.newRectangleShape(600, 50)
  objects.groundTwo.fixture = love.physics.newFixture(objects.groundTwo.body, objects.groundTwo.shape)
  
  --boundaries shit
  objects.boundOne = {}
  objects.boundOne.body = love.physics.newBody(world, 0, 0, "static")
  objects.boundOne.shape = love.physics.newRectangleShape(25, 1200)
  objects.boundOne.fixture = love.physics.newFixture(objects.boundOne.body, objects.boundOne.shape)
  
  objects.boundTwo = {}
  objects.boundTwo.body = love.physics.newBody(world, 0, 0, "static")
  objects.boundTwo.shape = love.physics.newRectangleShape(1500, 25)
  objects.boundTwo.fixture = love.physics.newFixture(objects.boundTwo.body, objects.boundTwo.shape)
  
  objects.boundThree = {}
  objects.boundThree.body = love.physics.newBody(world, 1400, 0, "static")
  objects.boundThree.shape = love.physics.newRectangleShape(25, 1200)
  objects.boundThree.fixture = love.physics.newFixture(objects.boundThree.body, objects.boundThree.shape)
  
  --block shit
  objects.blockOne = {}
  objects.blockOne.body = love.physics.newBody(world, 200, (600 - 50/2) - (50), "kinematic")
  objects.blockOne.shape = love.physics.newRectangleShape(200, 25)
  objects.blockOne.fixture = love.physics.newFixture(objects.blockOne.body, objects.blockOne.shape)
  objects.blockOne.grabbed = false
  objects.blockOne.joint = nil
  pickupableObjects[1] = objects.blockOne
  --objects.blockOne.body:setMass(500)
  objects.blockOne.body:setLinearDamping(.1)
  
  --objects.blockOne.body:setFixedRotation(true)
  --objects.blockOne.fixture:setRestitution(0)
  objects.blockOne.fixture:setFriction(1)
  objects.blockOne.fixture:setRestitution(0)
  
  keyboardPlayer.create(world)
  
  keyboardPlayer.setPosition(5, 50)
  
  love.graphics.setBackgroundColor(104, 136, 248)
  
end

function levelOne.update(dt)
  
  world:update(dt)
  keyboardPlayer.update(dt)
  mousePlayer.update(dt, pickupableObjects)
  
end

function levelOne.draw()
  
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
  
  --draw blocks
  love.graphics.setColor(25, 25, 25)
  
  love.graphics.polygon("fill", objects.blockOne.body:getWorldPoints(objects.blockOne.shape:getPoints()))
  
  love.graphics.setColor(255, 255, 255)
  
end