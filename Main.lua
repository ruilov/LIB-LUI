--[[
function setup()
    p = Panel(0,0)
    local b = TextButton("OK",10,10,100,100,
        {topColor=color(255,255,255,255),bottomColor=color(0,255,0,255)})
    b.onEnded = function(b,t) TextButton.onEnded(b,t) print("HO") end
    p:add(b)
    
    local b = Textbox(200,400,400)
    p:add(b)
end

function draw()
    background(0)
    p:draw()
    --p:translate(1,1)
end

function touched(t)
    p:touched(t)
end

function keyboard(key)
    p:keyboard(key)
end
--]]
