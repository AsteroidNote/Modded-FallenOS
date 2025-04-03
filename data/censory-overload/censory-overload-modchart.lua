function onCreate()
    setProperty('skipArrowStartTween', true) -- really good thing
end
function onCreatePost()
    noteTweenAlpha('playerNote0Alpha', 0, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote1Alpha', 1, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote2Alpha', 2, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote3Alpha', 3, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote4Alpha', 4, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote5Alpha', 5, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote6Alpha', 6, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote7Alpha', 7, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
end

local allowBounce = true
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if allowBounce and not isSustainNote then
        if downscroll then
            if noteData == 0 then
                noteTweenY("NoteBounce1Y",0,defaultPlayerStrumY0+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 1 then
                noteTweenY("NoteBounce2Y",1,defaultPlayerStrumY1+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 2 then
                noteTweenY("NoteBounce3Y",2,defaultPlayerStrumY2+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 3 then
                noteTweenY("NoteBounce4Y",3,defaultPlayerStrumY3+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
        else
            if noteData == 0 then
                noteTweenY("NoteBounce1Y",0,defaultPlayerStrumY0-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 1 then
                noteTweenY("NoteBounce2Y",1,defaultPlayerStrumY1-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 2 then
                noteTweenY("NoteBounce3Y",2,defaultPlayerStrumY2-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 3 then
                noteTweenY("NoteBounce4Y",3,defaultPlayerStrumY3-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end
end
function onTweenCompleted(tag)
    if tag == 'NoteBounce1Y' then
        noteTweenY("NoteBounceO1YF",0,defaultPlayerStrumY0, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if tag == 'NoteBounce2Y' then
        noteTweenY("NoteBounceO2YF",1,defaultPlayerStrumY1, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if tag == 'NoteBounce3Y' then
        noteTweenY("NoteBounceO3YF",2,defaultPlayerStrumY2, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if tag == 'NoteBounce4Y' then
        noteTweenY("NoteBounceO4YF",3,defaultPlayerStrumY3, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
end

local pincerEffect = false
local shakePincerEffect = false
local pincerNum = 0
local BSODEffect = false
function onUpdate(elapsed)
    -- note effect recreation ig
    beat = (getPropertyFromClass('Conductor', 'songPosition')/1000) * (bpm / 120)
    if BSODEffect == true then
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 15 * math.cos((beat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 0, 'x', defaultOpponentStrumX0 + 15 * math.cos((beat + i*0.25) * math.pi));
            setPropertyFromGroup('strumLineNotes', 1, 'x', defaultOpponentStrumX1 + 20 * math.cos((beat + i*0.25) * math.pi));
            setPropertyFromGroup('strumLineNotes', 2, 'x', defaultOpponentStrumX2 + 25 * math.cos((beat + i*0.25) * math.pi));
            setPropertyFromGroup('strumLineNotes', 3, 'x', defaultOpponentStrumX3 + 20 * math.cos((beat + i*0.25) * math.pi));
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 + 15 * math.cos((beat + i*0.25) * math.pi));
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 + 20 * math.cos((beat + i*0.25) * math.pi));
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 25 * math.cos((beat + i*0.25) * math.pi));
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 20 * math.cos((beat + i*0.25) * math.pi));
        end
        cameraShake('camGame', 0.0025, 0.25/getProperty('playbackRate'))
        cameraShake('camHUD', 0.0005, 0.25/getProperty('playbackRate'))
    end
    if pincerEffect == true then
        setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 + 15 * math.cos((beat + 4*0.25) * math.pi));
        setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 + 20 * math.cos((beat + 5*0.25) * math.pi));
        setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 25 * math.cos((beat + 6*0.25) * math.pi));
        setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 20 * math.cos((beat + 7*0.25) * math.pi));
        pincerTweenX("NoteMovePincer1X",1,getPropertyFromGroup('strumLineNotes', 4, 'x'), 0.015/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer2X",2,getPropertyFromGroup('strumLineNotes', 5, 'x'), 0.015/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer3X",3,getPropertyFromGroup('strumLineNotes', 6, 'x'), 0.015/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer4X",4,getPropertyFromGroup('strumLineNotes', 7, 'x'), 0.015/getProperty('playbackRate'), 'sineInOut')
    end
    if shakePincerEffect == true then
        setProperty('camHUD.angle', math.sin(((getSongPosition()/crochet)*math.pi))*5)
        if downscroll then
            setProperty('camHUD.x', math.sin(((getSongPosition()/crochet)*math.pi))*35)
        else
            setProperty('camHUD.x', math.sin(((getSongPosition()/crochet)*math.pi))*-35)
        end
    end
end

function onSongStart()
    if getPropertyFromClass('ClientPrefs','opponentStrums') then
        if middlescroll then
            noteTweenAlpha('playerNote0Alpha', 0, 0.35, 1/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenAlpha('playerNote0Alpha', 0, 1, 1/getProperty('playbackRate'), 'sineInOut')
        end
    end
    noteTweenAlpha('playerNote7Alpha', 7, 1, 0.75/getProperty('playbackRate'), 'sineInOut')
    setPropertyFromGroup('strumLineNotes', 0, 'y', defaultPlayerStrumY0 + 25)
    setPropertyFromGroup('strumLineNotes', 7, 'y', defaultPlayerStrumY0 + 25)
    noteTweenY('playerNote0Y', 0, defaultOpponentStrumY0, 0.75/getProperty('playbackRate'), 'sineInOut')
    noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3, 0.75/getProperty('playbackRate'), 'sineInOut')
end

function onBeatHit()
    -- effects lmfao
    if pincerFastMove == true then
        if curBeat % 1 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
            end
        end
        if curBeat % 2 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+pincerNum, 0.15/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end

    if pincerSlowMove == true then
        if curBeat % 2 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
            end
        end
        if curBeat % 4 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+pincerNum, 0.25/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end

    -- modchart no way!
    if curBeat == 4 then
        if getPropertyFromClass('ClientPrefs','opponentStrums') then
            if middlescroll then
                noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.75/getProperty('playbackRate'), 'sineInOut')
            else
                noteTweenAlpha('playerNote1Alpha', 1, 1, 0.75/getProperty('playbackRate'), 'sineInOut')
            end
        end
        noteTweenAlpha('playerNote6Alpha', 6, 1, 0.75/getProperty('playbackRate'), 'sineInOut')
        setPropertyFromGroup('strumLineNotes', 1, 'y', defaultPlayerStrumY0 + 25)
        setPropertyFromGroup('strumLineNotes', 6, 'y', defaultPlayerStrumY0 + 25)
        noteTweenY('playerNote1Y', 1, defaultOpponentStrumY1, 0.75/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2, 0.75/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 8 then
        if getPropertyFromClass('ClientPrefs','opponentStrums') then
            if middlescroll then
                noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.75/getProperty('playbackRate'), 'sineInOut')
            else
                noteTweenAlpha('playerNote2Alpha', 2, 1, 0.75/getProperty('playbackRate'), 'sineInOut')
            end
        end
        noteTweenAlpha('playerNote5Alpha', 5, 1, 0.75/getProperty('playbackRate'), 'sineInOut')
        setPropertyFromGroup('strumLineNotes', 2, 'y', defaultPlayerStrumY0 + 25)
        setPropertyFromGroup('strumLineNotes', 5, 'y', defaultPlayerStrumY0 + 25)
        noteTweenY('playerNote2Y', 2, defaultOpponentStrumY2, 0.75/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1, 0.75/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 12 then
        if getPropertyFromClass('ClientPrefs','opponentStrums') then
            if middlescroll then
                noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.75/getProperty('playbackRate'), 'sineInOut')
            else
                noteTweenAlpha('playerNote3Alpha', 3, 1, 0.75/getProperty('playbackRate'), 'sineInOut')
            end
        end
        noteTweenAlpha('playerNote4Alpha', 4, 1, 0.75/getProperty('playbackRate'), 'sineInOut')
        setPropertyFromGroup('strumLineNotes', 3, 'y', defaultPlayerStrumY0 + 25)
        setPropertyFromGroup('strumLineNotes', 4, 'y', defaultPlayerStrumY0 + 25)
        noteTweenY('playerNote3Y', 3, defaultOpponentStrumY3, 0.75/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0, 0.75/getProperty('playbackRate'), 'sineInOut')
    end
    -- just incase
    if curBeat > 16 and curBeat < 1024 then
        if getPropertyFromClass('ClientPrefs','opponentStrums') then
            if middlescroll then
                noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.5/getProperty('playbackRate'), nothing)
                noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.5/getProperty('playbackRate'), nothing)
                noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.5/getProperty('playbackRate'), nothing)
                noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.5/getProperty('playbackRate'), nothing)
            else
                noteTweenAlpha('playerNote0Alpha', 0, 1, 0.5/getProperty('playbackRate'), nothing)
                noteTweenAlpha('playerNote1Alpha', 1, 1, 0.5/getProperty('playbackRate'), nothing)
                noteTweenAlpha('playerNote2Alpha', 2, 1, 0.5/getProperty('playbackRate'), nothing)
                noteTweenAlpha('playerNote3Alpha', 3, 1, 0.5/getProperty('playbackRate'), nothing)
            end
        end
        noteTweenAlpha('playerNote4Alpha', 4, 1, 0.5/getProperty('playbackRate'), nothing)
        noteTweenAlpha('playerNote5Alpha', 5, 1, 0.5/getProperty('playbackRate'), nothing)
        noteTweenAlpha('playerNote6Alpha', 6, 1, 0.5/getProperty('playbackRate'), nothing)
        noteTweenAlpha('playerNote7Alpha', 7, 1, 0.5/getProperty('playbackRate'), nothing)
    end

    -- censory-overload, but KB is serious? of course!
    if curBeat == 372 then
        pincerPrepare(4,false)
    end
    if curBeat == 374 then
        pincerGrab(4)
        if downscroll then
            pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-48, 0.25/getProperty('playbackRate'), 'sineInOut')
        else
            pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+48, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 376 then
        pincerPrepare(4,true)
    end
    if curBeat == 380 then
        pincerPrepare(1,false)
        pincerPrepare(4,false)
    end
    if curBeat == 382 then
        pincerGrab(4)
        pincerGrab(1)
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        if downscroll then
            pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-48, 0.25/getProperty('playbackRate'), 'sineInOut')
        else
            pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+48, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 384 then
        pincerPrepare(1,true)
        pincerPrepare(4,true)
    end
    if curBeat == 388 then
        pincerPrepare(1,false)
        pincerPrepare(2,false)
        pincerPrepare(4,false)
    end
    if curBeat == 390 then
        pincerGrab(1)
        pincerGrab(2)
        pincerGrab(4)
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        if downscroll then
            pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-48, 0.25/getProperty('playbackRate'), 'sineInOut')
        else
            pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+48, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 392 then
        pincerPrepare(1,true)
        pincerPrepare(2,true)
        pincerPrepare(4,true)
    end
    if curBeat == 396 then
        pincerPrepare(2,false)
        pincerPrepare(4,false)
    end
    if curBeat == 398 then
        pincerGrab(2)
        pincerGrab(4)
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 400 then
        pincerPrepare(2,true)
        pincerPrepare(4,true)
    end

    if curBeat == 404 then
        pincerPrepare(1,false)
        pincerPrepare(3,false)
    end
    if curBeat == 406 then
        pincerGrab(1)
        pincerGrab(3)
        if downscroll then
            pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-48, 0.25/getProperty('playbackRate'), 'sineInOut')
        else
            pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+48, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 408 then
        pincerPrepare(1,true)
        pincerPrepare(3,true)
    end
    if curBeat == 412 then
        pincerPrepare(1,false)
        pincerPrepare(4,false)
    end
    if curBeat == 414 then
        pincerGrab(1)
        pincerGrab(4)
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        if downscroll then
            pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-48, 0.25/getProperty('playbackRate'), 'sineInOut')
        else
            pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+48, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 416 then
        pincerPrepare(1,true)
        pincerPrepare(4,true)
    end
    if curBeat == 420 then
        pincerPrepare(1,false)
        pincerPrepare(2,false)
        pincerPrepare(3,false)
        pincerPrepare(4,false)
    end
    if curBeat == 422 then
        pincerGrab(1)
        pincerGrab(2)
        pincerGrab(3)
        pincerGrab(4)
        if downscroll then
            pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove1Angle", 4, 24, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove2Angle", 5, -24, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove3Angle", 6, 24, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove4Angle", 7, -24, 0.25/getProperty('playbackRate'), 'sineInOut')
        else
            pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+48, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove1Angle", 4, -24, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove2Angle", 5, 24, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove3Angle", 6, -24, 0.25/getProperty('playbackRate'), 'sineInOut')
            noteTweenAngle("NoteMove4Angle", 7, 24, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')

        pincerTweenX("NoteMovePincer1X",1,defaultPlayerStrumX0-30, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-30, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer2X",2,defaultPlayerStrumX1-15, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-15, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer3X",3,defaultPlayerStrumX2+15, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+15, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer4X",4,defaultPlayerStrumX3+30, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+30, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 424 then
        pincerPrepare(1,true)
        pincerPrepare(2,true)
        pincerPrepare(3,true)
        pincerPrepare(4,true)
    end
    if curBeat == 428 then
        pincerPrepare(1,false)
        pincerPrepare(2,false)
        pincerPrepare(3,false)
        pincerPrepare(4,false)
    end
    if curBeat == 430 then
        pincerGrab(1)
        pincerGrab(2)
        pincerGrab(3)
        pincerGrab(4)
        noteTweenAngle("NoteMove1Angle", 4, 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle("NoteMove2Angle", 5, 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle("NoteMove3Angle", 6, 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle("NoteMove4Angle", 7, 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer1X",1,defaultPlayerStrumX0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer2X",2,defaultPlayerStrumX1, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer3X",3,defaultPlayerStrumX2, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer4X",4,defaultPlayerStrumX3, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 432 then
        pincerPrepare(1,true)
        pincerPrepare(2,true)
        pincerPrepare(3,true)
        pincerPrepare(4,true)
    end

    if curBeat == 622 then
        if getPropertyFromClass('ClientPrefs','opponentStrums') then
            pincerPrepare(5,false)
            if middlescroll then
                pincerPrepare(6,false)
            else
                pincerPrepare(4,false)
            end
        else
            pincerPrepare(1,false)
            pincerPrepare(4,false)
        end
    end
    if curBeat == 623 then
        if getPropertyFromClass('ClientPrefs','opponentStrums') then
            pincerGrab(1)
            if middlescroll then
                pincerGrab(2)
            else
                pincerGrab(4)
            end
        else
            pincerGrab(1)
            pincerGrab(4)
        end
    end
    if curBeat == 624 then
        shakePincerEffect = true
    end
    if curBeat == 688 then
        if getPropertyFromClass('ClientPrefs','opponentStrums') then
            pincerPrepare(5,true)
            if middlescroll then
                pincerPrepare(6,true)
            else
                pincerPrepare(4,true)
            end
        else
            pincerPrepare(1,true)
            pincerPrepare(4,true)
        end
        shakePincerEffect = false
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 704 then
        BSODEffect = true
    end
    if curBeat == 832 then
        BSODEffect = false
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0)
            setPropertyFromGroup('strumLineNotes', 0, 'x', defaultOpponentStrumX0);
            setPropertyFromGroup('strumLineNotes', 1, 'x', defaultOpponentStrumX1);
            setPropertyFromGroup('strumLineNotes', 2, 'x', defaultOpponentStrumX2);
            setPropertyFromGroup('strumLineNotes', 3, 'x', defaultOpponentStrumX3);
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0);
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1);
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2);
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3);
        end
    end
    if curBeat == 894 then
        pincerPrepare(1,false)
        pincerPrepare(2,false)
        pincerPrepare(3,false)
        pincerPrepare(4,false)
    end
    if curBeat == 895 then
        pincerFastMove = true
        if difficultyName == 'Hard' then
            pincerNum = 20
        elseif difficultyName == 'Harder' or difficultyName == 'Very Hard' then
            pincerNum = 40
        end
    end
    if curBeat == 896 then
        pincerGrab(1)
        pincerGrab(2)
        pincerGrab(3)
        pincerGrab(4)
        pincerEffect = true
    end
    if curBeat == 957 then
        pincerFastMove = false
    end
    if curBeat == 958 then
        pincerEffect = false
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer1X",1,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer2X",2,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer3X",3,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer4X",4,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 960 then
        pincerPrepare(1,true)
        pincerPrepare(2,true)
        pincerPrepare(3,true)
        pincerPrepare(4,true)
    end

    if curBeat == 976 then
        pincerPrepare(1,false)
        pincerPrepare(4,false)
    end
    if curBeat == 978 then
        pincerGrab(1)
        pincerGrab(4)
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+64, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+64, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-64, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-64, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 980 then
        pincerTweenX("NoteMovePincer1X",1,defaultPlayerStrumX3, 0.65/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX3, 0.65/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer4X",4,defaultPlayerStrumX0, 0.65/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX0, 0.65/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 982 then
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle("NoteMove1Angle", 4, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle("NoteMove4Angle", 7, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 984 then
        pincerPrepare(1,true)
        pincerPrepare(2,false)
        pincerPrepare(3,false)
        pincerPrepare(4,true)
    end
    if curBeat == 986 then
        pincerGrab(2)
        pincerGrab(3)
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-64, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-64, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+64, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+64, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 988 then
        pincerTweenX("NoteMovePincer2X",2,defaultPlayerStrumX2, 0.65/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX2, 0.65/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer3X",3,defaultPlayerStrumX1, 0.65/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX1, 0.65/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 990 then
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 992 then
        pincerPrepare(2,true)
        pincerPrepare(3,true)
    end
    if curBeat == 1020 then
        pincerPrepare(1,false)
        pincerPrepare(2,false)
        pincerPrepare(3,false)
        pincerPrepare(4,false)
    end
    if curBeat == 1022 then
        pincerGrab(1)
        pincerGrab(2)
        pincerGrab(3)
        pincerGrab(4)
        pincerTweenX("NoteMovePincer1X",1,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer2X",2,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer3X",3,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenX("NoteMovePincer4X",4,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 1024 then
        pincerPrepare(1,true)
        pincerPrepare(2,true)
        pincerPrepare(3,true)
        pincerPrepare(4,true)
    end

    if curBeat == 1040 then
        noteTweenAlpha('playerNote0Alpha', 0, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote4Alpha', 4, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote5Alpha', 5, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote6Alpha', 6, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote7Alpha', 7, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
    end
end