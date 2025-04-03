local bigNum = 0
function bigEyes()
    if not lowQuality then
        bigNum = bigNum + 1
        if bigNum >= 64 then
            bigNum = 0
        end

        makeAnimatedLuaSprite('bigEye'..bigNum, 'inhumanPack/hud/eye', math.random(0,1100), math.random(50,630))
        addAnimationByPrefix('bigEye'..bigNum, 'anim', 'eye', 40, false)
        addLuaSprite('bigEye'..bigNum, true);
        setScrollFactor('bigEye'..bigNum, 0, 0)
        scaleObject('bigEye'..bigNum, 0.65, 0.65)
        setProperty('bigEye'..bigNum..'.alpha', 0.6)
        setProperty('bigEye'..bigNum..'.angle', math.random(-25,25))
        playAnim('bigEye'..bigNum, 'anim', true);

        runTimer('bigEyeTimer'..bigNum, 1)
    end
end

local smallNum = 0
function smallEyes()
    if not lowQuality then
        smallNum = smallNum + 1
        if smallNum >= 64 then
            smallNum = 0
        end

        makeAnimatedLuaSprite('smallEye'..smallNum, 'inhumanPack/hud/eye', math.random(0,1100), math.random(50,630))
        addAnimationByPrefix('smallEye'..smallNum, 'anim', 'eye', 40, false)
        addLuaSprite('smallEye'..smallNum, true);
        setScrollFactor('smallEye'..smallNum, 0, 0)
        scaleObject('smallEye'..smallNum, 0.45, 0.45)
        setProperty('smallEye'..smallNum..'.alpha', 0.3)
        setProperty('smallEye'..smallNum..'.angle', math.random(-12.25,12.25))
        playAnim('smallEye'..smallNum, 'anim', true);

        runTimer('smallEyeTimer'..smallNum, 1)
    end
end

function onTimerCompleted(tag)
    for i = 0,64 do
        if tag == 'bigEyeTimer'..i then
            removeLuaSprite('bigEye'..i, false);
        elseif tag == 'smallEyeTimer'..i then
            removeLuaSprite('smallEye'..i, false);
        end
    end
end

local showSlowEyes = false
local showFastEyes = false
function onStepHit()
    if not lowQuality then
        if showSlowEyes == true then 
            if curStep % 8 == 0 then
                smallEyes()
            end
            if curStep % 16 == 0 then
                bigEyes()
            end
        end
    
        if showFastEyes == true then 
            if curStep % 2 == 0 then
                bigEyes()
                smallEyes()
            end
        end
    end
end

function onBeatHit()
    -- showing eye in certain moments
    if curBeat == 192 or curBeat == 448 then
        showFastEyes = true
    end
    if curBeat == 320 or curBeat == 576 then
        showFastEyes = false
    end
end