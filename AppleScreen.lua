-- AppleScreen.lua

AppleScreen = class(Panel)

function AppleScreen:init(schema)
    Panel.init(self,0,0)
    
    self.schema = schema
    
    -- create the title
    local title = TextBanner(self.schema.title,0,HEIGHT-50,WIDTH,50,
        {type="normal",topColor=color(244,245,247),bottomColor=color(141,145,157),
        text={fill=color(73,90,98)}})
    self:add(title)

    -- create the back button
    if self.schema.backButton then
        local backBut = TextButton(self.schema.backButton.text,7,HEIGHT-40,74,30,
            {type="back",topColor=color(140,140,150),bottomColor=color(78,85,96),
            pressedTopColor=color(38,38,38),pressedBottomColor=color(38,38,38),
            text={fill=color(224,224,225),fontSize=13,font="ArialRoundedMTBold"}})
        backBut.onEnded = function(b,t) 
            TextButton.onEnded(b,t) 
            self.schema.backButton.callback() 
        end
        self:add(backBut)
    end
    
    local currentH = title.y - 40
    for idx,elem in ipairs(self.schema.elems) do
        currentH = self:addElem(elem,currentH,p)
    end
end

function AppleScreen:addElem(elem,currentH)
    local type = elem.type
    if type == "block" then
        return self:addBlock(elem.elems,currentH)
    elseif type == "text" then
        return self:addText(elem,currentH)
    elseif type == "blank" then
        return self:addBlank(elem.amount,currentH)
    end 
end

-- text that you can't interact with
function AppleScreen:addText(elem,currentH)
    local textElem = TextElem(elem.text,55,currentH,
        {fill=color(59, 59, 61, 255)})
    local h = select(2,textElem:textSize())
    textElem:translate(0,-h)
    self:add(textElem)
    return currentH - h 
end

-- just blank space
function AppleScreen:addBlank(amount,currentH)
    return currentH - amount
end

-- a block of continuous elements
function AppleScreen:addBlock(elems,currentH)
    local numElems = #elems
    local h = 50 * numElems
    local y = currentH - h
    local banner = TextBanner("",50,y,WIDTH-100,h)
    self:add(banner)
    
    for idx,elem in ipairs(elems) do
        local type = "square"
        if idx == 1 then type = "topRound"
        elseif idx == #elems then type = "bottomRound" end
        if #elems == 1 then type = "round" end
        currentH = currentH - 50
        
        -- those things with a little arrow at the end
        if elem.type == "SimpleArrow" then    
            local but = AppleSimpleArrow(elem.text,50,currentH,WIDTH-100,
                {text={fontSize=21},type=type})
            if elem.callback then
                but.onEnded = function(b,t)
                    AppleSimpleArrow.onEnded(b,t)
                    elem.callback()
                end
            end
            self:add(but)
        elseif elem.type == "TextInput" then
            -- here's where you can enter some input
            local box = AppleTextbox(elem.label,50,currentH,WIDTH-100,
                {text={fontSize=21},type=type})
            self:add(box)
        end      
    end
    return currentH
end
