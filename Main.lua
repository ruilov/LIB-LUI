--[[
function setup()
    screen = Screen()
    obj = Button(10,20,101,171)
    screen:add(obj,"Planet Cute:Character Boy")
    obj.onEnded = function(o,t)
    end
end

function draw()
    background(0)
    screen:draw()
    obj:translate(1,0)
    obj:rotate(1)
end

function touched(t)
    screen:touched(t)
    obj:setPos(t.x-obj.w/2,t.y-obj.h/2)
end
--]]
