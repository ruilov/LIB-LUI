-- AppleSimpleArrow.lua

AppleSimpleArrow = class(TextButton)

function AppleSimpleArrow:init(text,x,y,w,args)
    local h = 50
    args = args or {}
    args.text = args.text or {}
    args.text.fontSize = 21
    args.text.textMode = CORNER
    args.pressedTopColor = color(0,130,255,255)
    args.pressedBottomColor = color(0,80,255,255)
    TextButton.init(self,text,x,y,w,h,args)
    
    local tw,th = self.banner.textElem:textSize()
    self.banner.textElem:translate(15 - self.banner.textElem.x,-th/2)
end

function AppleSimpleArrow:draw()
    TextButton.draw(self)
    
    -- draw a little arrow at the end
    pushStyle()
        --noSmooth()
        stroke(40, 60, 77, 255)
        strokeWidth(5)
        lineCapMode(SQUARE)
        line(self.x+self.w-25,self.y+17,self.x+self.w-15,self.y+26)
        line(self.x+self.w-25,self.y+33,self.x+self.w-15,self.y+24)
    popStyle()
end
