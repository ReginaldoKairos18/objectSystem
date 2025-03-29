local colision = {}

colision.isOnColsiion = function(obj1, obj2)
    return obj1.y + obj1.h > obj2.y and obj1.y < obj2.y + obj2.h and obj1.x + obj1.w > obj2.x and obj1.x < obj2.x + obj2.w
end

colision.isOnColsiionTop = function(obj1, obj2)
    return obj1.y < obj2.y + obj2.h and obj1.y + obj1.h > obj2.y and obj1.x < obj2.x + obj2.w and obj1.x + obj1.w > obj2.x
end

colision.isOnColsiionBotton = function(obj1, obj2)
    return obj1.y + obj1.h > obj2.y and obj1.y < obj2.y + obj2.h and obj1.x < obj2.x + obj2.w and obj1.x + obj1.w > obj2.x
end

return colision