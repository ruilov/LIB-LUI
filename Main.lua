--[[
function setup()
    local schema = {
        title = "Bluetooth",
        backButton = {
            text = "General", 
            callback = function() print("Pressed back") end
        },
        elems = {
            {type="block",elems = {
                {type="SimpleArrow", text = "About", callback = function() print("HI") end },
                {type="SimpleArrow", text = "Software Update"},
                {type="SimpleArrow", text = "Usage"},
            }},
            {type="blank",amount=30},
            {type="text",text="Now Discovereable"},
            {type="blank",amount=5},
            {type="block",elems = {
                {type="SimpleArrow", text = "Sounds"}
            }},
            {type="blank",amount=30},
            {type="block",elems = {
                {type="TextInput",label="Username"},
                {type="SimpleArrow", text = "Bluetooth"}
            }},
        }
    }
    
    p = AppleScreen(schema)
end


function draw()
    background(218,221,226)
    smooth()
    p:draw()
end

function touched(t)
    p:touched(t)
end

function keyboard(key)
    p:keyboard(key)
end
--]]
