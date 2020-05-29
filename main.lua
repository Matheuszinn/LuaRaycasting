-- Raycasting test in love 2d

require "scripts/dependencies"  

boundaries = {
    Boundary(0,0,0,WINDOW_HEIGHT),
    Boundary(0,0,WINDOW_WIDTH,0),
    Boundary(0,WINDOW_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT),
    Boundary(WINDOW_WIDTH,0,WINDOW_WIDTH,WINDOW_HEIGHT),
    Boundary(50,60,50,300)
}

particle = Particle()

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        --resizable = true,
    })

    love.window.setTitle("Raycating - LÖVE 2D")
end

function love.update(dt)
    
    mouseX, mouseY = love.mouse.getPosition()

    particle.pos.x = mouseX
    particle.pos.y = mouseY

end

function love.draw()

    particle:look(boundaries)

    particle:show()
    
    for i,_ in pairs(boundaries) do 
        boundaries[i]:show()
    end

    love.graphics.print("FPS: " .. love.timer.getFPS(),10,10)

end

function love.keypressed(key)
    if(key == "escape") then
        love.event.quit()
    end
end

function drawCollisionCircle(point)
    love.graphics.circle("fill",point.x,point.y,5)
end