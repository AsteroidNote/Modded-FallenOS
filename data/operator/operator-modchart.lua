function onStepHit()
    -- first part
    if curStep == 308 or curStep == 356 or curStep == 400 or curStep == 440 or curStep == 464 or curStep == 476 or curStep == 502 then
        noteTweenX('opponentNoteX0', 0, defaultPlayerStrumX3+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX1', 1, defaultPlayerStrumX2+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX2', 2, defaultPlayerStrumX1-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX3', 3, defaultPlayerStrumX0-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX0', 4, defaultPlayerStrumX3, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX1', 5, defaultPlayerStrumX2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX2', 6, defaultPlayerStrumX1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX3', 7, defaultPlayerStrumX0, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('squareX', 'square', 90, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-lineX', 'square-line', 90, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-line-effectX', 'square-line-effect', 90, 0.18/getProperty('playbackRate'), 'sineInOut')
    end
    if curStep == 312 or curStep == 360 or curStep == 420 or curStep == 442 or curStep == 470 or curStep == 496 or curStep == 508 then
        noteTweenX('opponentNoteX0', 0, defaultPlayerStrumX0-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX1', 1, defaultPlayerStrumX1-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX2', 2, defaultPlayerStrumX2+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX3', 3, defaultPlayerStrumX3+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX0', 4, defaultPlayerStrumX0, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX1', 5, defaultPlayerStrumX1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX2', 6, defaultPlayerStrumX2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX3', 7, defaultPlayerStrumX3, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('squareX', 'square', 0, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-lineX', 'square-line', 0, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-line-effectX', 'square-line-effect', 0, 0.18/getProperty('playbackRate'), 'sineInOut')
    end

    -- second part
    if curStep == 564 or curStep == 612 or curStep == 656 or curStep == 696 or curStep == 720 or curStep == 732 or curStep == 758 then
        noteTweenX('opponentNoteX0', 0, defaultPlayerStrumX3+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX1', 1, defaultPlayerStrumX2+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX2', 2, defaultPlayerStrumX1-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX3', 3, defaultPlayerStrumX0-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX0', 4, defaultPlayerStrumX3, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX1', 5, defaultPlayerStrumX2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX2', 6, defaultPlayerStrumX1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX3', 7, defaultPlayerStrumX0, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('squareX', 'square', 90, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-lineX', 'square-line', 90, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-line-effectX', 'square-line-effect', 90, 0.18/getProperty('playbackRate'), 'sineInOut')
    end
    if curStep == 568 or curStep == 616 or curStep == 676 or curStep == 698 or curStep == 726 or curStep == 752 or curStep == 764 then
        noteTweenX('opponentNoteX0', 0, defaultPlayerStrumX0-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX1', 1, defaultPlayerStrumX1-30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX2', 2, defaultPlayerStrumX2+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('opponentNoteX3', 3, defaultPlayerStrumX3+30, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX0', 4, defaultPlayerStrumX0, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX1', 5, defaultPlayerStrumX1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX2', 6, defaultPlayerStrumX2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNoteX3', 7, defaultPlayerStrumX3, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('squareX', 'square', 0, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-lineX', 'square-line', 0, 0.18/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('square-line-effectX', 'square-line-effect', 0, 0.18/getProperty('playbackRate'), 'sineInOut')
    end
end

local YEffect = false
function onBeatHit()
    if YEffect == true then
        if curBeat % 4 == 0 then
            doTweenY('camHUDY', 'camHUD', -25, 4/getProperty('playbackRate'), 'sineInOut')
        end
        if curBeat % 8 == 0 then
            doTweenY('camHUDY', 'camHUD', 25, 4/getProperty('playbackRate'), 'sineInOut')
        end
    else
        if curBeat % 1 == 0 then
            doTweenY('camHUDY', 'camHUD', 0, 2/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if curBeat == 67 then
        YEffect = true
    end

    -- 1st part
    if curBeat >= 68 and curBeat < 76 then
        doTweenX('camHUDX', 'camHUD', -62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 76 and curBeat < 84 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 84 and curBeat < 92 then
        doTweenX('camHUDX', 'camHUD', 62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 92 and curBeat < 100 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 100 and curBeat < 108 then
        doTweenX('camHUDX', 'camHUD', -62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 108 and curBeat < 116 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 116 and curBeat < 124 then
        doTweenX('camHUDX', 'camHUD', 62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 124 and curBeat < 132 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end

    -- 2nd part
    -- decided to make it faster than was
    if curBeat >= 132 and curBeat < 146 then
        doTweenX('camHUDX', 'camHUD', -100, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 136 and curBeat < 140 then
        doTweenX('camHUDX', 'camHUD', 0, 1.5/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 140 and curBeat < 144 then
        doTweenX('camHUDX', 'camHUD', 150, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 144 and curBeat < 148 then
        doTweenX('camHUDX', 'camHUD', 0, 1.5/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 148 and curBeat < 152 then
        doTweenX('camHUDX', 'camHUD', -150, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 152 and curBeat < 156 then
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 156 and curBeat < 160 then
        doTweenX('camHUDX', 'camHUD', 200, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 160 and curBeat < 164 then
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 164 and curBeat < 168 then
        doTweenX('camHUDX', 'camHUD', -200, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 168 and curBeat < 172 then
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 172 and curBeat < 176 then
        doTweenX('camHUDX', 'camHUD', 150, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 176 and curBeat < 180 then
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 180 and curBeat < 184 then
        doTweenX('camHUDX', 'camHUD', -150, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 184 and curBeat < 188 then
        doTweenX('camHUDX', 'camHUD', 0, 1.5/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 188 and curBeat < 192 then
        doTweenX('camHUDX', 'camHUD', 100, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 192 and curBeat < 196 then
        doTweenX('camHUDX', 'camHUD', 0, 1.5/getProperty('playbackRate'), nothing)
    end

    -- final - less motion
    if curBeat >= 196 and curBeat < 204 then
        doTweenX('camHUDX', 'camHUD', -62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 204 and curBeat < 212 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 212 and curBeat < 220 then
        doTweenX('camHUDX', 'camHUD', 62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 220 and curBeat < 228 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 228 and curBeat < 236 then
        doTweenX('camHUDX', 'camHUD', -62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 236 and curBeat < 244 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 244 and curBeat < 252 then
        doTweenX('camHUDX', 'camHUD', 62.5, 4/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 252 and curBeat < 260 then
        doTweenX('camHUDX', 'camHUD', 0, 2/getProperty('playbackRate'), nothing)
    end
    
    if curBeat == 66 then
        if downscroll then
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
        else
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
        end
        doTweenZoom('HUD', 'camHUD', 0.8, 1/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 68 then
        setProperty('defaultCamHUDZoom', 0.8)
    end
    -- first part
    if curBeat == 74 or curBeat == 90 or curBeat == 99 or curBeat == 114 or curBeat == 130 then
        if downscroll then
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") - 578 - 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
            noteTweenY('opponentNoteY0', 0, defaultPlayerStrumY0-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY1', 1, defaultPlayerStrumY1-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY2', 2, defaultPlayerStrumY2-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY3', 3, defaultPlayerStrumY3-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY0', 4, defaultPlayerStrumY0-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY1', 5, defaultPlayerStrumY1-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY2', 6, defaultPlayerStrumY2-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY3', 7, defaultPlayerStrumY3-500, 0.175/getProperty('playbackRate'), 'sineInOut')
        else
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") + 555 + 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
            noteTweenY('opponentNoteY0', 0, defaultPlayerStrumY0+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY1', 1, defaultPlayerStrumY1+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY2', 2, defaultPlayerStrumY2+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY3', 3, defaultPlayerStrumY3+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY0', 4, defaultPlayerStrumY0+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY1', 5, defaultPlayerStrumY1+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY2', 6, defaultPlayerStrumY2+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY3', 7, defaultPlayerStrumY3+500, 0.175/getProperty('playbackRate'), 'sineInOut')
        end
        doTweenY('squareY', 'square.scale', -1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-lineY', 'square-line.scale', -1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-line-effectY', 'square-line-effect.scale', -1.6, 0.175/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 82 or curBeat == 98 or curBeat == 106 or curBeat == 122 or curBeat == 131 then
        if downscroll then
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") - 78 - 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
        else
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") + 55 + 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
        end
        noteTweenY('opponentNoteY0', 0, defaultPlayerStrumY0, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('opponentNoteY1', 1, defaultPlayerStrumY1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('opponentNoteY2', 2, defaultPlayerStrumY2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('opponentNoteY3', 3, defaultPlayerStrumY3, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote0', 4, defaultPlayerStrumY0, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote1', 5, defaultPlayerStrumY1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote2', 6, defaultPlayerStrumY2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote3', 7, defaultPlayerStrumY3, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('squareY', 'square.scale', 1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-lineY', 'square-line.scale', 1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-line-effectY', 'square-line-effect.scale', 1.6, 0.175/getProperty('playbackRate'), 'sineInOut')
    end

    -- lets make something like i did in kill-switch lmfao
    if curBeat == 131 then
        noteTweenAlpha('opponentNote0Alpha', 0, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('opponentNote1Alpha', 1, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('opponentNote2Alpha', 2, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('opponentNote3Alpha', 3, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    -- second part
    if curBeat == 138 or curBeat == 154 or curBeat == 163 or curBeat == 178 or curBeat == 194 then
        if downscroll then
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") - 578 - 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
            noteTweenY('opponentNoteY0', 0, defaultPlayerStrumY0-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY1', 1, defaultPlayerStrumY1-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY2', 2, defaultPlayerStrumY2-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY3', 3, defaultPlayerStrumY3-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY0', 4, defaultPlayerStrumY0-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY1', 5, defaultPlayerStrumY1-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY2', 6, defaultPlayerStrumY2-500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY3', 7, defaultPlayerStrumY3-500, 0.175/getProperty('playbackRate'), 'sineInOut')
        else
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") + 555 + 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
            noteTweenY('opponentNoteY0', 0, defaultPlayerStrumY0+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY1', 1, defaultPlayerStrumY1+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY2', 2, defaultPlayerStrumY2+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('opponentNoteY3', 3, defaultPlayerStrumY3+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY0', 4, defaultPlayerStrumY0+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY1', 5, defaultPlayerStrumY1+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY2', 6, defaultPlayerStrumY2+500, 0.175/getProperty('playbackRate'), 'sineInOut')
            noteTweenY('playerNoteY3', 7, defaultPlayerStrumY3+500, 0.175/getProperty('playbackRate'), 'sineInOut')
        end
        doTweenY('squareY', 'square.scale', -1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-lineY', 'square-line.scale', -1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-line-effectY', 'square-line-effect.scale', -1.6, 0.175/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 146 or curBeat == 162 or curBeat == 170 or curBeat == 186 or curBeat == 195 then
        if downscroll then
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") - 78 - 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
        else
            for i = 0,7 do
                setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                doTweenY('botPlayTxtY', 'botplayTxt', getProperty("timeBarBG.y") + 55 + 75, 0.175/getProperty('playbackRate'), 'sineInOut')
            end
        end
        noteTweenY('opponentNoteY0', 0, defaultPlayerStrumY0, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('opponentNoteY1', 1, defaultPlayerStrumY1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('opponentNoteY2', 2, defaultPlayerStrumY2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('opponentNoteY3', 3, defaultPlayerStrumY3, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote0', 4, defaultPlayerStrumY0, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote1', 5, defaultPlayerStrumY1, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote2', 6, defaultPlayerStrumY2, 0.175/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote3', 7, defaultPlayerStrumY3, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('squareY', 'square.scale', 1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-lineY', 'square-line.scale', 1.5, 0.175/getProperty('playbackRate'), 'sineInOut')
        doTweenY('square-line-effectY', 'square-line-effect.scale', 1.6, 0.175/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 196 then
        setProperty('defaultCamHUDZoom', 0.9)
        if downscroll then
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
        else
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") - 75, 1/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") + 75, 1/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 258 then 
        doTweenZoom('HUD', 'camHUD', 0.025, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 259 then
        setProperty('defaultCamHUDZoom', 0.025)
    end
end