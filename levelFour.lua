levelFour = {}

require("enemyBullet")

local keyboardPlayer = require("playerOne")
local mousePlayer = require("playerTwo")

local world, objects, pickupableObjects, buttons, players

function levelFour.load(arg)
  
  world = love.physics.newWorld(0, 9.81 * 1000, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  
  pickupableObjects = {}
  
  buttons = {}
  
  objects = {}
  
  players = {}
  
  --ground shit
  objects.groundOne = {}
  objects.groundOne.body = love.physics.newBody(world, 0, 600 - 50/2, "static")
  objects.groundOne.shape = love.physics.newRectangleShape(1800, 100)
  objects.groundOne.fixture = love.physics.newFixture(objects.groundOne.body, objects.groundOne.shape)
  
  --boundaries shit
  objects.boundOne = {}
  objects.boundOne.body = love.physics.newBody(world, 0, 0, "static")
  objects.boundOne.shape = love.physics.newRectangleShape(25, 1200)
  objects.boundOne.fixture = love.physics.newFixture(objects.boundOne.body, objects.boundOne.shape)
  
  objects.boundTwo --[[falling in love]]= {}
  objects.boundTwo.body = love.physics.newBody(world, 0, 0, "static")
  objects.boundTwo.shape = love.physics.newRectangleShape(1700, 25)
  objects.boundTwo.fixture = love.physics.newFixture(objects.boundTwo.body, objects.boundTwo.shape)
  
  objects.boundThree = {}
  objects.boundThree.body = love.physics.newBody(world, 800, 25, "static")
  objects.boundThree.shape = love.physics.newRectangleShape(25, 1200)
  objects.boundThree.fixture = love.physics.newFixture(objects.boundThree.body, objects.boundThree.shape)
  
  --block shit
  objects.blockOne = {}
  objects.blockOne.body = love.physics.newBody(world, 175, (600 - 250/2) + 25/2 - (50), "kinematic")
  objects.blockOne.width = 200
  objects.blockOne.height = 25
  objects.blockOne.isPlayer = false
  objects.blockOne.shape = love.physics.newRectangleShape(200, 25)
  objects.blockOne.fixture = love.physics.newFixture(objects.blockOne.body, objects.blockOne.shape)
  objects.blockOne.grabbed = false
  objects.blockOne.joint = nil
  pickupableObjects[1] = objects.blockOne
  --objects.blockOne.body:setAngle(objects.blockOne.body:getAngle() + .8)
  objects.blockOne.body:setLinearDamping(.1)
  objects.blockOne.fixture:setFriction(1)
  objects.blockOne.fixture:setRestitution(0)
  players[1] = objects.blockOne
  
  --shooters shit
  objects.shooterOne = {}
  --objects.shooterOne
  
  --collision shit
  objects.endzone = {}
  objects.endzone.width = 25
  objects.endzone.height = 25
  objects.endzone.getDimensions = function()
                                  
                                    return objects.endzone.width, objects.endzone.height
                                  
                                  end
  objects.endzone.body = love.physics.newBody(world, 750, 500 + 25/2, "static")
  objects.endzone.shape = love.physics.newRectangleShape(25, 25)
  objects.endzone.fixture = love.physics.newFixture(objects.endzone.body, objects.endzone.shape)
  
  keyboardPlayer.create(world)
  
  keyboardPlayer.setPosition(5, 50)
  
  players[2] = keyboardPlayer.box
  
  love.graphics.setBackgroundColor(104, 136, 248)
  
end

function levelFour.update(dt)
  
  enemyBullet.create(400, 25, "s")
  enemyBullet.create(400 - 50, 25, "s")
  enemyBullet.create(400 + 50, 25, "s")
  enemyBullet.create(400 + 100, 25, "s")
  enemyBullet.create(400 - 100, 25, "s")
  enemyBullet.create(200, 25, "se")
  enemyBullet.create(225, 25, "se")
  enemyBullet.create(250, 25, "se")
  enemyBullet.create(275, 25, "se")
  enemyBullet.create(550, 25, "sw")
  enemyBullet.create(575, 25, "sw")
  enemyBullet.create(600, 25, "sw")
  enemyBullet.create(625, 25, "sw")
  enemyBullet.create(650, 25, "sw")
  
  enemyBullet.update(dt, players)
  
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
    levelFour.load("nigga")
  
  end
  
  --print(a,b,c,d,e,f,g,h)
  
  if CheckCollision(a,b,c,d,e,f,g,h) then
    
    print("we made it")
    world:destroy()
    state = "bossFight"
    bossFight.load("nigga")
    --state = "levelTwo"
    
  end  
  
end

function levelFour.draw()
  
  keyboardPlayer.draw()
  mousePlayer.draw()
  enemyBullet.draw()
  
  --draw ground
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill", objects.groundOne.body:getWorldPoints(objects.groundOne.shape:getPoints()))
 
  
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
  
  print("X: "..tostring(objects.blockOne.body:getX()))
  print("Y: "..tostring(objects.blockOne.body:getY()))
  love.graphics.circle("fill", objects.blockOne.body:getX(), objects.blockOne.body:getY(), 5)
  
end

function levelFour.destroy()
  
  world:destroy()
  currentObjects = nil
  levelFour.load("nigga")
  
end