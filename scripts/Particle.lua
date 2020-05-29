Particle = Class{}

function Particle:init()
    self.pos = vector.new(WINDOW_WIDTH/2, WINDOW_HEIGHT/2)
    self.rays = {}

    local angle = 360

    --[[   for i = 0, 600  do 
        table.insert(self.rays, Ray(self.pos, math.rad(i)) )
    end 
 ]]
    while true do 

        if angle < 0 then 
            break
        else
            table.insert(self.rays, Ray(self.pos, math.rad(angle)))
            angle = utils.round((angle - 1), 1)
        end

    end

end


function Particle:look(walls)
    if type(walls) ~= "table" then 
        return
    else
        for i, rays in pairs(self.rays) do 
            local closest = nil
            local record = math.huge
            for i = 1,#walls do
                
                local point = rays:cast(walls[i])

                if point ~= nil then
                    local d = point:dist(self.pos)
                    
                    if d < record then 
                        record = d
                        closest = point
                    end
                end
            end

            if closest ~= nil then
                love.graphics.push("all")
                love.graphics.setColor(love.math.colorFromBytes (255,255,255,100))
                love.graphics.line(self.pos.x,self.pos.y,closest.x,closest.y)
                love.graphics.pop()
            end

        end
    end
end

function Particle:show()
    love.graphics.setLineWidth(NOT_THICC_STROKE)
    love.graphics.circle("fill",self.pos.x,self.pos.y,5)

    for i, rays in pairs(self.rays) do 
        rays:show()
    end

end