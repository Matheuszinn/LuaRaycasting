Boundary = Class{}

function Boundary:init(x1,y1,x2,y2)
    self.a = vector.new(x1,y1)
    self.b = vector.new(x2,y2)

    self.points = {
        self.a.x,
        self.a.y
    }

end

function Boundary:show()
    love.graphics.push("all")

    love.graphics.setLineWidth(THICC_STROKE)
    love.graphics.setColor(love.math.colorFromBytes(139, 255, 0))
    love.graphics.line(self.a.x, self.a.y, self.b.x, self.b.y)
    
    love.graphics.pop()
end