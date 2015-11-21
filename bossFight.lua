bossFight = {}

local keyboardPlayer-- = require("playerOne")
local mousePlayer-- = require("playerTwo")

local world, objects, pickupableObjects, buttons, players

function bossFight.load(arg)
  
  keyboardPlayer = require("playerOne")
  mousePlayer = require("playerTwo")
  
  world = love.physics.newWorld(0, 9.81 * 1000, true)
  
  pickupableObjects = {}
  
  objects = {}
  
  players = {}
  
  buttons = {}
  
  --ground shit
  objects.groundOne = {}
  objects.groundOne.body = love.physics.newBody(world, 400, 600 - 50/2, "static")
  objects.groundOne.shape = love.physics.newRectangleShape(300, 100)
  objects.groundOne.fixture = love.physics.newFixture(objects.groundOne.body, objects.groundOne.shape)
  
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
  
  keyboardPlayer.create(world)
  
  keyboardPlayer.setPosition(5, 50)
  
  players[2] = keyboardPlayer.box
  
  love.graphics.setBackgroundColor(104, 136, 248)
  
end

function bossFight.update(dt)
  
  enemyBullet.update(dt, players)
  
  currentObjects = pickupableObjects
  
  world:update(dt)
  local status = keyboardPlayer.update(dt, buttons)
  mousePlayer.update(dt, pickupableObjects)
  
  if status == false then
    
    world:destroy()
    currentObjects = nil
    bossFight.load("nigga")
    
  end
  
end

function bossFight.draw()

  keyboardPlayer.draw()
  mousePlayer.draw()
  enemyBullet.draw()
  
  --draw ground
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill", objects.groundOne.body:getWorldPoints(objects.groundOne.shape:getPoints()))
  
  --draw blocks
  love.graphics.setColor(25, 25, 25)
  
  love.graphics.polygon("fill", objects.blockOne.body:getWorldPoints(objects.blockOne.shape:getPoints()))
  
  
  love.graphics.setColor(255, 255, 255)
  

end