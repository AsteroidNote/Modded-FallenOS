function onCreatePost()
    for i = 4,7 do 
        if downscroll then
            noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0 + 250, 0.0005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0 - 250, 0.0005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    pincerPrepare(1,false)
    pincerPrepare(2,false)
    pincerPrepare(3,false)
    pincerPrepare(4,false)
    pincerGrab(1)
    pincerGrab(2)
    pincerGrab(3)
    pincerGrab(4)
    for m = 1,4 do
        setProperty('pincer'..m..'.alpha', 0)
    end
end

function onCreate()
    setProperty('skipArrowStartTween', true) -- really good thing
end

function onCountdownTick(swagCounter)
    if swagCounter == 0 then
        for i = 4,7 do
            noteTweenY('noteTweenStartY'..i, i, defaultPlayerStrumY0, (bpm/240)/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if swagCounter == 1 then
        for m = 1,4 do
            doTweenAlpha('pincerAlpha'..m, 'pincer'..m, 1, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end
end

function onSongStart()
    if downscroll then
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
    else
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 25, 0.005/getProperty('playbackRate'), 'sineInOut')
end

local pincerEffect = false
local slowPincerEffect = false
local mediumPincerEffect = false
local fastPincerEffect = false
local shakePincerEffect = false
function onUpdate(elapsed)
    -- note effect recreation ig
    beat = (getSongPosition()/1000) * (bpm / 60)
    if pincerEffect == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 16 * math.cos((beat + i*0.25) * math.pi))
            if doXthing == true then
                setPropertyFromGroup('strumLineNotes', 0, 'x', defaultPlayerStrumX0 - 25 + 15 * math.cos((beat + 4*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 1, 'x', defaultPlayerStrumX1 - 15 + 15 * math.cos((beat + 5*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 2, 'x', defaultPlayerStrumX2 + 15 + 15 * math.cos((beat + 6*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 3, 'x', defaultPlayerStrumX3 + 25 + 15 * math.cos((beat + 7*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 10 + 15 * math.cos((beat + 4*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 0 + 15 * math.cos((beat + 5*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 0 + 15 * math.cos((beat + 6*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 10 + 15 * math.cos((beat + 7*0.25) * math.pi))
            end
        end
    end

    if slowPincerEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 0, 'x', defaultPlayerStrumX0 - 25 + 15 * math.cos((beat/4 + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 1, 'x', defaultPlayerStrumX1 - 15 + 15 * math.cos((beat/4 + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 2, 'x', defaultPlayerStrumX2 + 15 + 15 * math.cos((beat/4 + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 3, 'x', defaultPlayerStrumX3 + 25 + 15 * math.cos((beat/4 + 7*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 10 + 15 * math.cos((beat/4 + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 0 + 15 * math.cos((beat/4 + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 0 + 15 * math.cos((beat/4 + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 10 + 15 * math.cos((beat/4 + 7*0.25) * math.pi))
        end
    end

    if mediumPincerEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 0, 'x', defaultPlayerStrumX0 - 25 + 15 * math.cos((beat/2 + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 1, 'x', defaultPlayerStrumX1 - 15 + 15 * math.cos((beat/2 + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 2, 'x', defaultPlayerStrumX2 + 15 + 15 * math.cos((beat/2 + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 3, 'x', defaultPlayerStrumX3 + 25 + 15 * math.cos((beat/2 + 7*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 10 + 15 * math.cos((beat/2 + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 0 + 15 * math.cos((beat/2 + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 0 + 15 * math.cos((beat/2 + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 10 + 15 * math.cos((beat/2 + 7*0.25) * math.pi))
        end
    end

    if fastPincerEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat*2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat*2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 0, 'x', defaultPlayerStrumX0 - 25 + 15 * math.cos((beat + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 1, 'x', defaultPlayerStrumX1 - 15 + 15 * math.cos((beat + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 2, 'x', defaultPlayerStrumX2 + 15 + 15 * math.cos((beat + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 3, 'x', defaultPlayerStrumX3 + 25 + 15 * math.cos((beat + 7*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 10 + 15 * math.cos((beat + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 0 + 15 * math.cos((beat + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 0 + 15 * math.cos((beat + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 10 + 15 * math.cos((beat + 7*0.25) * math.pi))
        end
    end

    if shakePincerEffect == true then
        setProperty('camHUD.angle', math.sin(((getSongPosition()/crochet)*math.pi))*5)
        if downscroll then
            setProperty('camHUD.x', math.sin(((getSongPosition()/crochet)*math.pi))*35)
        else
            setProperty('camHUD.x', math.sin(((getSongPosition()/crochet)*math.pi))*-35)
        end
    end

    -- this shit will move pincers to the current note position - makes easy to move notes LMFAO
    pincerTweenX("NoteMovePincer1X",1,getPropertyFromGroup('strumLineNotes', 4, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenX("NoteMovePincer2X",2,getPropertyFromGroup('strumLineNotes', 5, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenX("NoteMovePincer3X",3,getPropertyFromGroup('strumLineNotes', 6, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenX("NoteMovePincer4X",4,getPropertyFromGroup('strumLineNotes', 7, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer1Y",1,getPropertyFromGroup('strumLineNotes', 4, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer2Y",2,getPropertyFromGroup('strumLineNotes', 5, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer3Y",3,getPropertyFromGroup('strumLineNotes', 6, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer4Y",4,getPropertyFromGroup('strumLineNotes', 7, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')
end

local insaneBeatEffect = false
function onBeatHit()
    if insaneBeatEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 2.5)
            setProperty('camHUD.zoom', 1.05)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            end
        end
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -2.5)
            setProperty('camHUD.zoom', 1.05)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            end
        end
    end

    if curBeat == 10 or curBeat == 16 or curBeat == 28 or curBeat == 32 or curBeat == 38 or curBeat == 43 or curBeat == 45 or curBeat == 48 or curBeat == 54 or curBeat == 59 or curBeat == 61 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 4 or curBeat == 8 or curBeat == 18 or curBeat == 24 or curBeat == 34 or curBeat == 36 or curBeat == 41 or curBeat == 46 or curBeat == 50 or curBeat == 52 or curBeat == 57 or curBeat == 62 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 2 or curBeat == 12 or curBeat == 20 or curBeat == 30 or curBeat == 33 or curBeat == 39 or curBeat == 42 or curBeat == 44 or curBeat == 49 or curBeat == 55 or curBeat == 58 or curBeat == 60 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 6 or curBeat == 14 or curBeat == 22 or curBeat == 26 or curBeat == 35 or curBeat == 37 or curBeat == 40 or curBeat == 47 or curBeat == 51 or curBeat == 53 or curBeat == 56 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end

    -- thing from og inhuman
    if curBeat == 32 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 9.2/getProperty('playbackRate'), 'circOut')
        if downscroll then
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
        else
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") + 40, 9.2/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") - 40, 9.2/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if curBeat == 64 then
        pincerEffect = true
        setProperty('defaultCamHUDZoom', 0.85)
    end
    if curBeat == 72 or curBeat == 88 or curBeat == 104 or curBeat == 120 or curBeat == 136 or curBeat == 152 or curBeat == 168 or curBeat == 184 then
        shakePincerEffect = true
    end
    if curBeat == 80 or curBeat == 112 or curBeat == 126 or curBeat == 144 or curBeat == 176 or curBeat == 190 then
        shakePincerEffect = false
        setProperty('camHUD.angle', 0)
        setProperty('camHUD.x', 0)
    end

    if curBeat == 94 or curBeat == 158 then
        shakePincerEffect = false
        setProperty('camHUD.x', 0)
        doTweenAngle('camHUDAngle', 'camHUD', 12.25, 1.25/getProperty('playbackRate'), 'circOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1, 1.25/getProperty('playbackRate'), 'circOut')
    end
    if curBeat == 96 or curBeat == 160 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.3/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 190 then
        pincerEffect = false
        for i = 4,7 do 
            noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if curBeat == 192 or curBeat == 202 or curBeat == 208 or curBeat == 220 or curBeat == 224 or curBeat == 230 or curBeat == 235 or curBeat == 237 or curBeat == 240 or curBeat == 246 or curBeat == 251 or curBeat == 253 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 196 or curBeat == 200 or curBeat == 210 or curBeat == 216 or curBeat == 226 or curBeat == 228 or curBeat == 233 or curBeat == 238 or curBeat == 242 or curBeat == 244 or curBeat == 249 or curBeat == 254 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 194 or curBeat == 204 or curBeat == 212 or curBeat == 222 or curBeat == 225 or curBeat == 231 or curBeat == 234 or curBeat == 236 or curBeat == 241 or curBeat == 247 or curBeat == 250 or curBeat == 252 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 198 or curBeat == 206 or curBeat == 214 or curBeat == 218 or curBeat == 227 or curBeat == 229 or curBeat == 232 or curBeat == 239 or curBeat == 243 or curBeat == 245 or curBeat == 248 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 254 then
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-12.25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+12.25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+25, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 256 then
        slowPincerEffect = true
    end
    if curBeat == 320 then
        slowPincerEffect = false
        mediumPincerEffect = true
    end
    if curBeat == 382 then
        mediumPincerEffect = false
        noteTweenY("NoteMove1OY",0,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2OY",1,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3OY",2,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4OY",3,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 384 or curBeat == 394 or curBeat == 400 or curBeat == 412 or curBeat == 416 or curBeat == 422 or curBeat == 427 or curBeat == 429 or curBeat == 432 or curBeat == 438 or curBeat == 443 or curBeat == 445 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 388 or curBeat == 392 or curBeat == 402 or curBeat == 408 or curBeat == 418 or curBeat == 420 or curBeat == 425 or curBeat == 430 or curBeat == 434 or curBeat == 436 or curBeat == 441 or curBeat == 446 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 386 or curBeat == 396 or curBeat == 404 or curBeat == 414 or curBeat == 417 or curBeat == 423 or curBeat == 426 or curBeat == 428 or curBeat == 433 or curBeat == 439 or curBeat == 442 or curBeat == 444 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 390 or curBeat == 398 or curBeat == 406 or curBeat == 410 or curBeat == 419 or curBeat == 421 or curBeat == 424 or curBeat == 431 or curBeat == 435 or curBeat == 437 or curBeat == 440 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 448 then
        pincerEffect = true
    end
    if curBeat == 456 or curBeat == 472 or curBeat == 488 or curBeat == 504 or curBeat == 520 or curBeat == 536 or curBeat == 552 or curBeat == 568 then
        shakePincerEffect = true
    end
    if curBeat == 464 or curBeat == 496 or curBeat == 510 or curBeat == 528 or curBeat == 560 or curBeat == 574 then
        shakePincerEffect = false
        setProperty('camHUD.angle', 0)
        setProperty('camHUD.x', 0)
    end

    if curBeat == 478 or curBeat == 542 then
        shakePincerEffect = false
        setProperty('camHUD.x', 0)
        doTweenAngle('camHUDAngle', 'camHUD', 12.25, 1.25/getProperty('playbackRate'), 'circOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1, 1.25/getProperty('playbackRate'), 'circOut')
    end
    if curBeat == 480 or curBeat == 544 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.3/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 510 then
        doTweenAngle('camGameAngle', 'camGame', -6.125, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenAngle('camHUDAngle', 'camHUD', -6.125, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('defaultCamGameZoom', 1.05)
        setProperty('defaultCamHUDZoom', 0.95)
    end

    if curBeat == 511 then
        doTweenAngle('camGameAngle', 'camGame', 6.125, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenAngle('camHUDAngle', 'camHUD', 6.125, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('defaultCamGameZoom', 1.1)
        setProperty('defaultCamHUDZoom', 1.05)
    end

    if curBeat == 512 then
        doTweenAngle('camGameAngle', 'camGame', 0, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('defaultCamGameZoom', 1)
        setProperty('defaultCamHUDZoom', 0.85)
    end

    if curBeat == 574 then
        pincerEffect = false
        for i = 4,7 do 
            noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-12.25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+12.25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+25, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 576 then
        mediumPincerEffect = true
    end
    if curBeat == 640 then
        mediumPincerEffect = false
        fastPincerEffect = true
    end
    if curBeat == 702 then
        fastPincerEffect = false
        noteTweenY("NoteMove1OY",0,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2OY",1,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3OY",2,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4OY",3,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 704 then
        pincerEffect = true
    end
    if curBeat == 712 or curBeat == 728 or curBeat == 744 or curBeat == 760 or curBeat == 520 or curBeat == 536 or curBeat == 552 or curBeat == 568 then
        shakePincerEffect = true
    end
    if curBeat == 720 or curBeat == 752 or curBeat == 766 or curBeat == 528 or curBeat == 560 or curBeat == 574 then
        shakePincerEffect = false
        setProperty('camHUD.angle', 0)
        setProperty('camHUD.x', 0)
    end

    if curBeat == 766 then
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-12.25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+12.25, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+25, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 768 then
        pincerEffect = false
        fastPincerEffect = true
    end

    if curBeat == 734 or curBeat == 798 or curBeat == 830 then
        shakePincerEffect = false
        setProperty('camHUD.x', 0)
        doTweenAngle('camHUDAngle', 'camHUD', 12.25, 1.25/getProperty('playbackRate'), 'circOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1, 1.25/getProperty('playbackRate'), 'circOut')
    end
    if curBeat == 736 or curBeat == 800 or curBeat == 832 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.3/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 815 then
        insaneBeatEffect = true
    end
    if curBeat == 829 then
        insaneBeatEffect = false
    end

    if curBeat == 830 then
        fastPincerEffect = false
        noteTweenY("NoteMove1OY",0,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2OY",1,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3OY",2,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4OY",3,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 832 or curBeat == 842 or curBeat == 848 or curBeat == 860 or curBeat == 864 or curBeat == 870 or curBeat == 875 or curBeat == 877 or curBeat == 880 or curBeat == 886 or curBeat == 881 or curBeat == 893 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 836 or curBeat == 840 or curBeat == 850 or curBeat == 856 or curBeat == 866 or curBeat == 868 or curBeat == 873 or curBeat == 878 or curBeat == 882 or curBeat == 884 or curBeat == 889 or curBeat == 894 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 834 or curBeat == 844 or curBeat == 852 or curBeat == 862 or curBeat == 865 or curBeat == 871 or curBeat == 874 or curBeat == 876 or curBeat == 881 or curBeat == 887 or curBeat == 890 or curBeat == 892 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 838 or curBeat == 846 or curBeat == 854 or curBeat == 858 or curBeat == 867 or curBeat == 869 or curBeat == 872 or curBeat == 879 or curBeat == 883 or curBeat == 885 or curBeat == 888 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 25, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'NoteMove1Y' then
        noteTweenY('NoteMove1YFinish',4,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove2Y' then
        noteTweenY('NoteMove2YFinish',5,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove3Y' then
        noteTweenY('NoteMove3YFinish',6,defaultPlayerStrumY2, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove4Y' then
        noteTweenY('NoteMove4YFinish',7,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
    end

    if tag == 'NoteMove1X' then
        noteTweenX("NoteMove1XFinish",4,defaultPlayerStrumX0, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove4X' then
        noteTweenX("NoteMove4XFinish",7,defaultPlayerStrumX3, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
end