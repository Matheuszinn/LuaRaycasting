Ray = Class{}

function Ray:init(pos, angle)
    self.pos = pos
    self.dir = vector.fromAngle(angle)
end

function Ray:lookAt(x,y)
    self.dir.x = x - self.pos.x
    self.dir.y = y - self.pos.y
    self.dir:norm()
end

function Ray:show()
    love.graphics.push()
    love.graphics.setLineWidth(0)
    love.graphics.translate(self.pos.x,self.pos.y)
    love.graphics.line(0,0,self.dir.x * RAY_LENGHT,self.dir.y * RAY_LENGHT)

    love.graphics.pop()
end

function Ray:cast(boundary)
    local x1 = boundary.a.x
    local y1 = boundary.a.y
    local x2 = boundary.b.x
    local y2 = boundary.b.y
    
    local x3 = self.pos.x
    local y3 = self.pos.y
    local x4 = self.pos.x + self.dir.x
    local y4 = self.pos.y + self.dir.y

    local den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
    
    if den == 0 then 
        return
    end

    local t = ((x1 - x3) * (y3-y4) - (y1 - y3)* (x3 - x4)) / den;
    local u = -((x1 - x2) * (y1-y3) - (y1 - y2)* (x1 - x3)) / den;

    if(t > 0 and t < 1 and u > 0) then
        local point = vector.new()
        point.x = x1 + t * (x2 - x1)
        point.y = y1 + t * (y2 - y1)
        
        return point
    else
        return
    end

end