mainMenu = {}

local playButton, quitButton

function mainMenu.load(arg)
  
  playButton = {}
  quitButton = {}
  
  playButton.width = 200
  playButton.height = 100
  playButton.x = 300
  playButton.y = 229
  playButton.vertices = {playButton.x, playButton.y, playButton.x + playButton.width, playButton.y, playButton.x + playButton.width, playButton.y + playButton.height, playButton.x, playButton.y + playButton.height}
 
  quitButton.width = 200
  quitButton.height = 100
  quitButton.x = 300
  quitButton.y = 390
  quitButton.vertices = {quitButton.x, quitButton.y, quitButton.x + quitButton.width, quitButton.y, quitButton.x + quitButton.width, quitButton.y + quitButton.height, quitButton.x, quitButton.y + quitButton.height}
  
end

function mainMenu.update(dt)
  
  if love.mouse.isDown("l") and CheckCollision(playButton.x, playButton.y, playButton.width, playButton.height, select(1, love.mouse.getPosition()), select(2, love.mouse.getPosition()), 1, 1) then
    
    levelOne.load("nigga")
    state = "levelOne"
    
  end
  
  if love.mouse.isDown("l") and CheckCollision(quitButton.x, quitButton.y, quitButton.width, quitButton.height, select(1, love.mouse.getPosition()), select(2, love.mouse.getPosition()), 1, 1) then
    
    love.event.quit()
    
  end
  
end

function mainMenu.draw()
  
  love.graphics.setBackgroundColor(65, 119, 93)
  
  love.graphics.setPointSize(50)
  love.graphics.print("My Game part 2 fifth edition", love.window.getWidth()/2 - 75, 100)
  
  love.graphics.setColor(69, 69, 69)
  love.graphics.rectangle("fill", love.window.getWidth()/2 - 100, 229, 200, 100)
  
  love.graphics.setColor(251, 192, 205)
  love.graphics.print("Play", love.window.getWidth()/2 - 13, 272)
  
  love.graphics.setColor(251, 192, 205)
  love.graphics.rectangle("fill", love.window.getWidth()/2 - 100, 391, 200, 100)
  
  love.graphics.setColor(69, 69, 69)
  love.graphics.print("Quit", love.window.getWidth()/2 - 20, 434)
  
  love.graphics.setColor(255, 255, 255)
  
  
  love.graphics.print("X: "..tostring(love.mouse.getPosition()).."\nY: "..tostring(select(2, love.mouse.getPosition())), 0, 10)
end