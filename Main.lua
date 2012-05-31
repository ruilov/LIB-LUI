
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
                {type="SimpleArrow", text = "Software Update",rightText="Nice one!"},
                {type="SimpleArrow", text = "Usage", rightText = "Two"},
            }},
            {type="blank",amount=30},
            {type="text",text="Now Discovereable"},
            {type="blank",amount=5},
            {type="block",elems = {
                {type="TextInput", label = "username",shadowText="himan"},
                {type="TextInput", label = "username"},
                --[[
                {type="SimpleArrow", text = "Sounds",tag="temp"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                {type="SimpleArrow", text = "Sounds"},
                --]]
            }},
            {type="blank",amount=30},
            {type="block",elems = {
            --[[
                {type="TextInput",label="Username"},
                {type="SimpleArrow", text = "Bluetooth"}
                --]]
            }},
        }
    }
    
    p = AppleScreen(schema)
    --p.taggedElems.temp:showHourGlass(true)
    --p.taggedElems.temp:setColors(color(255,0,0),color(255,0,0))
end


function draw()
    background(0)
    smooth()
    p:draw()
    --[[
    textMode(CORNER)
    fontSize(20)
    fill(255,0,0,255)
    text("d"..ElapsedTime,100,100)
    --]]
end

function touched(t)
    p:touched(t)
    if GLOBAL_SHOWKEYBOARD then
        GLOBAL_SHOWKEYBOARD = nil
        showKeyboard()
    end
end

function keyboard(key)
    p:keyboard(key)
end

