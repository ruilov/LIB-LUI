-- AppleHourGlass

AppleHourGlass = class(RectObj)

function AppleHourGlass:init(x,y,w,h)
    RectObj.init(self,x,y,w,h)
    
    self.lines = {}
    for ang = 0,360,30 do
        local a = math.rad(ang)
        local x1 = w * math.cos(a) * .25 + x + w/2
        local y1 = h * math.sin(a) * .25 + y + h/2
        local x2 = w * math.cos(a) * .5 + x + w/2
        local y2 = h * math.sin(a) * .5 + y + h/2
        table.insert(self.lines,{x1=x1,y1=y1,x2=x2,y2=y2,ang=ang})
    end
    
    self.pointing = 0
end

function AppleHourGlass:draw()
    pushStyle()
    strokeWidth(3)
    lineCapMode(PROJECT)
    for _,elem in ipairs(self.lines) do
        local dang = math.abs(elem.ang - self.pointing)
        if dang < 45 or dang > 315 then
            stroke(40,60,77)
        else
            stroke(120,140,157)
        end
        line(elem.x1,elem.y1,elem.x2,elem.y2)
    end
    self.pointing = (self.pointing + 5)%360
    popStyle()
end

