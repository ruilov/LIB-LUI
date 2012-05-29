--[[
function setup()
    p = Panel(0,0)
    local b = Button(0,0,WIDTH,HEIGHT)
    b.onEnded = function(b,t) print("HO") end
    p:add(b)
end

function draw()
    
end

function touched(t)
    p:touched(t)
end
--]]
