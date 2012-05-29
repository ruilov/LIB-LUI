-- TextButton.lua
-- by Vega from the codea forums

TextButton = class(Button)

function TextButton:init(text,x,y,w,h,args)
    Button.init(self,x,y,w,h)

    args = args or {}
    args.text = args.text or {}
    
    self.text = text
    self.textColor = args.text.color or color(0,0,0,255)
    self.font = args.text.font or "ArialRoundedMTBold"
    self.fontSize = args.text.fontSize or 28
    
    self.topColor = args.topColor or color(255, 255, 255, 255) 
    self.bottomColor = args.bottomColor or color(255,255,255,255)
    self.pressedTopColor = args.pressedTopColor or color(127,127,127,255)
    self.pressedBottomColor = args.pressedBottomColorcolor or color(127,127,127,255)
    self.pressed = false

    self.myMesh = mesh()
    self.vertColors = {}
    self:moveCB()
end

function TextButton:moveCB()
    self.verts = self:createVerts()
    self.myMesh.vertices = triangulate(self.verts)
    self:recolor()
end

function TextButton:onBegan(t)
    self.pressed = true
end

function TextButton:onEnded(t)
    self.pressed = false
end

function TextButton:touched(t)
    local didTouch = Button.touched(self,t)
    if not didTouch then self.pressed = false end -- make sure we go back to the original color
end

function TextButton:draw()
    self:recolor()
    pushMatrix()
    pushStyle()
    translate(self.x,self.y)
    
    -- draw the background
    self.myMesh:draw()
    
    -- draw the text
    textMode(CENTER)
    fill(self.textColor)
    fontSize(self.fontSize)
    font(self.font)
    text(self.text, self.w/2,self.h/2)
    
    -- draw the border
    self:drawLines(self.verts)
    popStyle()
    popMatrix()
end

function TextButton:createVerts(w,h)
    local w,h = self.w,self.h
    
    local r = math.max(math.floor(math.min(w,h)/100+.5),1)
    local v = {}
    
    v[1] = vec2(w,6*r)
    v[2] = vec2(w-r,4*r)
    v[3] = vec2(w-2*r,2*r)
    v[4] = vec2(w-4*r,r)
    v[5] = vec2(w-6*r,0)
    
    v[6] = vec2(6*r,0)
    v[7] = vec2(4*r,r)
    v[8] = vec2(2*r,2*r)
    v[9] = vec2(r,4*r)
    v[10] = vec2(0,6*r)
    
    v[11] = vec2(0,h-6*r)
    v[12] = vec2(r,h-4*r)
    v[13] = vec2(2*r,h-2*r)
    v[14] = vec2(4*r,h-r)
    v[15] = vec2(6*r,h)
    
    v[16] = vec2(w-6*r,h)
    v[17] = vec2(w-4*r,h-r)
    v[18] = vec2(w-2*r,h-2*r)
    v[19] = vec2(w-r,h-4*r)
    v[20] = vec2(w,h-6*r)
    return v
end

function TextButton:drawLines(v)
    noSmooth()
    strokeWidth(1)
    stroke(0, 0, 0, 192)
    for i=1, #v do
        local nextI = i%(#v)+1
        line(v[i].x,v[i].y,v[nextI].x,v[nextI].y)
    end
end

function TextButton:recolor()
    local topCol = self.topColor
    local bottomCol = self.bottomColor
    
    if self.pressed then 
        topCol = self.pressedTopColor
        bottomCol = self.pressedBottomColor
    end
    
    for i=1,3 * #self.verts - 6 do
        if self.myMesh.vertices[i].y > self.h/2 then
            self.vertColors[i] = topCol
        else
            self.vertColors[i] = bottomCol
        end
    end
    self.myMesh.colors = self.vertColors
end
