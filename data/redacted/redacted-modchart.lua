function onSongStart()
    setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
end

function onBeatHit()
    if curBeat == 16 then
        setProperty('defaultCamGameZoom',0.9)
    end
    if curBeat >= 120 and curBeat < 124 or curBeat >= 136 and curBeat < 140 or curBeat >= 128 and curBeat < 132 or curBeat >= 144 and curBeat < 148 then
        doTweenX('camGameX', 'camGame', 0, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 116 and curBeat < 120 or curBeat >= 132 and curBeat < 136 then
        doTweenX('camGameX', 'camGame', 50, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', 50, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 124 and curBeat < 128 or curBeat >= 140 and curBeat < 144 then
        doTweenX('camGameX', 'camGame', -50, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', -50, 1/getProperty('playbackRate'), nothing)
    end

    if curBeat >= 144 and curBeat < 148 or curBeat >= 152 and curBeat < 156 or curBeat >= 160 and curBeat < 164 or curBeat >= 168 and curBeat < 172 then
        doTweenX('camGameX', 'camGame', 0, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 148 and curBeat < 152 or curBeat >= 164 and curBeat < 168 then
        doTweenX('camGameX', 'camGame', 50, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', 50, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 156 and curBeat < 160 or curBeat >= 172 and curBeat < 176 then
        doTweenX('camGameX', 'camGame', -50, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', -50, 1/getProperty('playbackRate'), nothing)
    end

    -- 1st part finish
    if curBeat >= 176 and curBeat < 180 then
        doTweenX('camGameX', 'camGame', 0, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end

    if curBeat == 176 then
        setProperty('defaultCamGameZoom',1.1)
    end

    if curBeat == 204 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 206 then
        setProperty('defaultCamGameZoom',1.25)
    end
    if curBeat == 208 then
        setProperty('defaultCamGameZoom',0.9)
    end

    if curBeat >= 208 and curBeat < 240 then
        -- opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-321, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-321, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-321, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-321, 2/getProperty('playbackRate'), nothing)
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+321, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+321, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+321, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+321, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat == 304 then
        setProperty('defaultCamGameZoom',1.25)
    end
    if curBeat >= 304 and curBeat < 336 then
        --opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3, 2/getProperty('playbackRate'), nothing)
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), nothing)
        noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), nothing)
        noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), nothing)
        noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), nothing)
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 2/getProperty('playbackRate'), nothing)
    end

    if curBeat == 336 then
        setProperty('defaultCamGameZoom',0.7)
        noteTweenAlpha('playerNote0Alpha', 0, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.2, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat >= 336 and curBeat < 368 then
        -- opponent
        noteTweenX('playerNote0X', 0, defaultOpponentStrumX0, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote1X', 1, defaultOpponentStrumX1, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote2X', 2, defaultOpponentStrumX2, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote3X', 3, defaultOpponentStrumX3, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 340 and curBeat < 344 or curBeat >= 356 and curBeat < 360 then
        doTweenX('camGameX', 'camGame', 50, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', 50, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 344 and curBeat < 348 or curBeat >= 352 and curBeat < 356 or curBeat >= 360 and curBeat < 364 or curBeat >= 368 and curBeat < 372 then
        doTweenX('camGameX', 'camGame', 0, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 348 and curBeat < 352 or curBeat >= 364 and curBeat < 368 then
        doTweenX('camGameX', 'camGame', -50, 1/getProperty('playbackRate'), nothing)
        doTweenX('camHUDX', 'camHUD', -50, 1/getProperty('playbackRate'), nothing)
    end
    if curBeat >= 368 and curBeat < 408 then
        setProperty('defaultCamGameZoom',1.1)
        -- opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2, 2/getProperty('playbackRate'), nothing)
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3, 2/getProperty('playbackRate'), nothing)
    end
    if curBeat == 400 then
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 408 then
		doTweenAlpha('camHUDAlpha', 'camHUD', 0, 5/getProperty('playbackRate'), 'sineInOut')
    end
end