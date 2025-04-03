function onBeatHit()	
	-- pincers from qt mod for sawblades thing
	if difficultyName == 'Sawblades' then
		if curBeat == 16 then
			pincerPrepare(1,false)
		elseif curBeat == 18 then
			pincerPrepare(4,false)
		elseif curBeat == 20 then
			pincerGrab(1)
			if downscroll then
				pincerTweenY("NoteMovePincer1",1,defaultPlayerStrumY0-55,0.5, quadinout)
				noteTweenY("NoteMove1",4,defaultPlayerStrumY0-55,0.5, quadinout)
			else
				pincerTweenY("NoteMovePincer1",1,defaultPlayerStrumY0+55,0.5, quadinout)
				noteTweenY("NoteMove1",4,defaultPlayerStrumY0+55,0.5, quadinout)
			end
		elseif curBeat == 22 then
			pincerGrab(4)
			
			if downscroll then
				pincerTweenY("NoteMovePincer2Y",4,defaultPlayerStrumY3-55,0.5, quadinout)
				noteTweenY("NoteMove2Y",7,defaultPlayerStrumY3-55,0.5, quadinout)
			else
				pincerTweenY("NoteMovePincer2Y",4,defaultPlayerStrumY3+55,0.5, quadinout)
				noteTweenY("NoteMove2Y",7,defaultPlayerStrumY3+55,0.5, quadinout)
			end
			
			pincerTweenX("NoteMovePincer2X",4,defaultPlayerStrumX3+75,0.5, quadinout)
			noteTweenX("NoteMove2X",7,defaultPlayerStrumX3+75,0.5, quadinout)
		elseif curBeat == 24 then
			pincerPrepare(4,true)
			pincerPrepare(1,true)
			
		elseif curBeat == 32 then
			pincerPrepare(3,false)
		elseif curBeat == 34 then
			pincerPrepare(2,false)
		elseif curBeat == 36 then
			pincerGrab(3)
			if downscroll then
				pincerTweenY("NoteMovePincer3",3,defaultPlayerStrumY2-100,0.5, quadinout)
				noteTweenY("NoteMove3",6,defaultPlayerStrumY2-100,0.5, quadinout)
			else
				pincerTweenY("NoteMovePincer3",3,defaultPlayerStrumY2+100,0.5, quadinout)
				noteTweenY("NoteMove3",6,defaultPlayerStrumY2+100,0.5, quadinout)
			end
		elseif curBeat == 38 then
			pincerGrab(2)
			if downscroll then
				pincerTweenY("NoteMovePincer4",2,defaultPlayerStrumY1+60,0.5, quadinout)
				noteTweenY("NoteMove4",5,defaultPlayerStrumY1+60,0.5, quadinout)
			else
				pincerTweenY("NoteMovePincer4",2,defaultPlayerStrumY1-60,0.5, quadinout)
				noteTweenY("NoteMove4",5,defaultPlayerStrumY1-60,0.5, quadinout)
			end
		elseif curBeat == 40 then
			pincerPrepare(2,true)
			pincerPrepare(3,true)
			
		elseif curBeat == 92 then
			pincerPrepare(3,false)
		elseif curBeat == 93 then
			pincerPrepare(4,false)
		elseif curBeat == 94 then
			pincerPrepare(1,false)
		elseif curBeat == 95 then
			pincerPrepare(2,false)
		elseif curBeat == 96 then
			pincerGrab(4)
			pincerGrab(3)
			pincerGrab(2)
			pincerGrab(1)

			pincerTweenX("NoteMovePincerReset1X",1,defaultPlayerStrumX0,1, quadinout)
			noteTweenX("NoteMoveReset1X",4,defaultPlayerStrumX0,1, quadinout)
			pincerTweenY("NoteMovePincerReset1Y",1,defaultPlayerStrumY0,1, quadinout)
			noteTweenY("NoteMoveReset1Y",4,defaultPlayerStrumY0,1, quadinout)
			
			pincerTweenX("NoteMovePincerReset2X",2,defaultPlayerStrumX1,1, quadinout)
			noteTweenX("NoteMoveReset2X",5,defaultPlayerStrumX1,1, quadinout)
			pincerTweenY("NoteMovePincerReset2Y",2,defaultPlayerStrumY1,1, quadinout)
			noteTweenY("NoteMoveReset2Y",5,defaultPlayerStrumY1,1, quadinout)
			
			pincerTweenX("NoteMovePincerReset3X",3,defaultPlayerStrumX2,1, quadinout)
			noteTweenX("NoteMoveReset3X",6,defaultPlayerStrumX2,1, quadinout)
			pincerTweenY("NoteMovePincerReset3Y",3,defaultPlayerStrumY2,1, quadinout)
			noteTweenY("NoteMoveReset3Y",6,defaultPlayerStrumY2,1, quadinout)
			
			pincerTweenX("NoteMovePincerReset4X",4,defaultPlayerStrumX3,1, quadinout)
			noteTweenX("NoteMoveReset4X",7,defaultPlayerStrumX3,1, quadinout)
			pincerTweenY("NoteMovePincerReset4Y",4,defaultPlayerStrumY3,1, quadinout)
			noteTweenY("NoteMoveReset4Y",7,defaultPlayerStrumY3,1, quadinout)
			
		elseif curBeat == 99 then
			pincerPrepare(4,true)
			pincerPrepare(3,true)
			pincerPrepare(2,true)
			pincerPrepare(1,true)
		end
	end
end