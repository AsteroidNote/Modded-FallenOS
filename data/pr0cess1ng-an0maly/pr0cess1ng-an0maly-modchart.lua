local pincerEffect1 = false
local pincerEffect2 = false
local shakeEffect = false
function onCreatePost()
    setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 +15);
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 +12.5);
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 -12.5);
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 -15);
    setPropertyFromGroup('opponentStrums', 0, 'visible', false);
    setPropertyFromGroup('opponentStrums', 1, 'visible', false);
    setPropertyFromGroup('opponentStrums', 2, 'visible', false);
    setPropertyFromGroup('opponentStrums', 3, 'visible', false);
end

function onStepHit()
    if pincerEffect1 == true then
        if curStep % 4 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
            end
            doTweenAngle('camHUDAngle', 'camHUD', 2, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', 2, 0.1/getProperty('playbackRate'), 'sineInOut')
        end
        if curStep % 8 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
            end
            doTweenAngle('camHUDAngle', 'camHUD', -2, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', -2, 0.1/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if pincerEffect2 == true then
        if curStep % 4 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
            end
            doTweenAngle('camHUDAngle', 'camHUD', 2, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', 2, 0.1/getProperty('playbackRate'), 'sineInOut')
        end
        if curStep % 8 == 0 then
            if downscroll then
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3-32, 0.1/getProperty('playbackRate'), 'sineInOut')
            else
                pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')

                noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1+32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2-32, 0.1/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3+32, 0.1/getProperty('playbackRate'), 'sineInOut')
            end
            doTweenAngle('camHUDAngle', 'camHUD', -2, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', -2, 0.1/getProperty('playbackRate'), 'sineInOut')
        end
    end
end

local pincerEffect = false
function onUpdate(elapsed)
    if shakeEffect == true then 
        cameraShake('camHUD', 0.0025, 0.05/getProperty('playbackRate'))
        cameraShake('camGame', 0.0025, 0.05/getProperty('playbackRate')) 
    end

    beat = (getPropertyFromClass('Conductor', 'songPosition')/1000) * (bpm / 120)
    if pincerEffect == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 32 * math.cos((beat + i*0.25) * math.pi))
            pincerTweenY("NoteMovePincer1Y",1,getPropertyFromGroup('strumLineNotes', 4, 'y'), 0.015/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer2Y",2,getPropertyFromGroup('strumLineNotes', 5, 'y'), 0.015/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer3Y",3,getPropertyFromGroup('strumLineNotes', 6, 'y'), 0.015/getProperty('playbackRate'), 'sineInOut')
            pincerTweenY("NoteMovePincer4Y",4,getPropertyFromGroup('strumLineNotes', 7, 'y'), 0.015/getProperty('playbackRate'), 'sineInOut')
        end
    end
end

function onBeatHit()
    if curBeat == 128 then
        shakeEffect = true
    end
    if curBeat == 190 then
        shakeEffect = false
    end
    if curBeat == 192 then
        shakeEffect = true
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 256 then
        shakeEffect = false
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 316 then
        pincerPrepare(1,false)
        pincerPrepare(2,false)
        pincerPrepare(3,false)
        pincerPrepare(4,false)
    end
    if curBeat == 318 then
        pincerGrab(1)
        pincerGrab(2)
        pincerGrab(3)
        pincerGrab(4)
    end
    if curBeat == 320 then
        pincerEffect1 = true
    end
    if curBeat == 335 then
        pincerEffect1 = false
        pincerEffect2 = true
    end
    if curBeat == 351 then
        pincerEffect2 = false
        pincerEffect1 = true
    end
    if curBeat == 367 then
        pincerEffect1 = false
        pincerEffect2 = true
    end
    if curBeat == 382 then
        pincerEffect1 = false
        pincerEffect2 = false
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 384 then
        pincerEffect1 = true
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 399 then
        pincerEffect1 = false
        pincerEffect2 = true
    end
    if curBeat == 415 then
        pincerEffect2 = false
        pincerEffect1 = true
    end
    if curBeat == 431 then
        pincerEffect1 = false
        pincerEffect2 = true
    end
    if curBeat == 448 then
        pincerEffect1 = false
        pincerEffect2 = false
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 450 then
        pincerPrepare(1,true)
        pincerPrepare(2,true)
        pincerPrepare(3,true)
        pincerPrepare(4,true)
    end
    if curBeat == 540 then
        pincerPrepare(1,false)
        pincerPrepare(2,false)
        pincerPrepare(3,false)
        pincerPrepare(4,false)
    end
    if curBeat == 542 then
        pincerGrab(1)
        pincerGrab(2)
        pincerGrab(3)
        pincerGrab(4)
    end
    if curBeat == 544 then
        shakeEffect = true
        pincerEffect = true
    end
    if curBeat == 606 then
        shakeEffect = false
        pincerEffect = false
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.25/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 608 then
        shakeEffect = true
        pincerEffect = true
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 670 then
        doTweenAngle('camHUDAngle', 'camHUD', 25, 1.5/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camHUDX', 'camHUD', 25, 1.5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 25, 1.5/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camGameX', 'camGame', 25, 1.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 672 then
        shakeEffect = false
        pincerEffect = false
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer1Y",1,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer2Y",2,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer3Y",3,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        pincerTweenY("NoteMovePincer4Y",4,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove1Y",0,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove2Y",1,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove3Y",2,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("OpponentNoteMove4Y",3,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camGameX', 'camGame', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 674 then
        pincerPrepare(1,true)
        pincerPrepare(2,true)
        pincerPrepare(3,true)
        pincerPrepare(4,true)
    end
end