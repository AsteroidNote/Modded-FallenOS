local moveEffect = false
local shakeEffect = false
local returnToNormal = false
local returnToNormalShake = false
function onUpdate(elapsed)
    beat = (getSongPosition()/1000) * (bpm / 60)
    if moveEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 - 7.5 * math.cos((beat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 15 * math.cos((beat/2 + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 15 * math.cos((beat/2 + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 - 15 * math.cos((beat/2 + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 - 15 * math.cos((beat/2 + 7*0.25) * math.pi))
            returnToNormal = true
        end
    else
        if returnToNormal == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0)
                setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0)
                setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1)
                setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2)
                setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3)
                returnToNormal = false
            end
        end
    end

    if shakeEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 - 10 * math.cos((beat*2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 20 * math.cos((beat*4 + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 20 * math.cos((beat*4 + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 - 20 * math.cos((beat*4 + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 - 20 * math.cos((beat*4 + 7*0.25) * math.pi))
            returnToNormalShake = true
        end
    else
        if returnToNormalShake == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0)
                setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0)
                setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1)
                setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2)
                setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3)
                returnToNormalShake = false
            end
        end
    end
end

local beatEffect = false
function onBeatHit()
    -- effects on beat
    if beatEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 5)
            setProperty('camHUD.zoom', 1.1)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 1, 1/getProperty('playbackRate'), 'circOut')
            setProperty('camGame.angle', 2.5)
            setProperty('camGame.zoom', 1.1)
            doTweenAngle('camGameAngle', 'camGame', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1, 1/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            end

            for i = 4,7 do
                setPropertyFromGroup('strumLineNotes', i, 'direction', 100)
                noteTweenDirection('noteDirection'..i, i, 90, 0.45/getProperty('playbackRate'), 'circOut')
            end
        end
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -2.5)
            setProperty('camHUD.zoom', 1.1)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 1, 1/getProperty('playbackRate'), 'circOut')
            setProperty('camGame.angle', -2.5)
            setProperty('camGame.zoom', 1.1)
            doTweenAngle('camGameAngle', 'camGame', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1, 1/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            end

            for i = 4,7 do
                setPropertyFromGroup('strumLineNotes', i, 'direction', 80)
                noteTweenDirection('noteDirection'..i, i, 90, 0.45/getProperty('playbackRate'), 'circOut')
            end
        end
    end

    if curBeat == 7 then
        shakeEffect = true
    end

    if curBeat == 8 then
        moveEffect = true
        shakeEffect = false
    end

    if curBeat == 71 then
        beatEffect = true
        moveEffect = false
        shakeEffect = true
    end

    if curBeat == 132 then
        shakeEffect = false
    end

    if curBeat == 133 then
        beatEffect = false
    end
end