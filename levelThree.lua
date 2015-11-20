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
  --objects.groundOne.body = love.physics.newBody(world, 0, 
  
end

function levelThree.update(dt)
  
end

function levelThree.draw()
  
end