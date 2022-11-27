local singing = 0

function onCreate()

addLuaScript('custom_notetypes/keyfriend sing') -- can you guess what this does

makeAnimatedLuaSprite('keyfriend', 'characters/keyfriend', -305, 375)

	addAnimationByPrefix('keyfriend', 'idle', 'KF idle', 24, true)
	addAnimationByPrefix('keyfriend', 'singLEFT', 'KF Left0', 24, false)
	addAnimationByPrefix('keyfriend', 'singDOWN', 'KF Down0', 24, false)
	addAnimationByPrefix('keyfriend', 'singUP', 'KF Up0', 24, false)
	addAnimationByPrefix('keyfriend', 'singRIGHT', 'KF Right0', 24, false)

		addLuaSprite('keyfriend', true)
		
	
end

function onStepHit()
    if getProperty('keyfriend.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then
        objectPlayAnimation('keyfriend','idle');	
    end
		
	
end

function onUpdate(elapsed)
	-- this makes it so it doesnt play the idle if another animation is being played
	if getProperty('keyfriend.animation.curAnim.name') ~= 'idle' and not getProperty('keyfriend.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed)

            if getProperty('keyfriend.animation.curAnim.name') == 'idle' then
                setProperty('keyfriend.offset.x',0)
				setProperty('keyfriend.offset.y',0)
                
			
			elseif getProperty('keyfriend.animation.curAnim.name') == 'singLEFT' then
                setProperty('keyfriend.offset.x',3)
				setProperty('keyfriend.offset.y',-1)
              
			
			elseif getProperty('keyfriend.animation.curAnim.name') == 'singUP' then
                setProperty('keyfriend.offset.x',-4)
				setProperty('keyfriend.offset.y',52)
               
			
			elseif getProperty('keyfriend.animation.curAnim.name') == 'singDOWN' then
                setProperty('keyfriend.offset.x',18)
				setProperty('keyfriend.offset.y',-52)
                
			
			elseif getProperty('keyfriend.animation.curAnim.name') == 'singRIGHT' then
                setProperty('keyfriend.offset.x',-15)
				setProperty('keyfriend.offset.y',0)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

if noteType == 'keyfriend sing' and noteData == 0 then

	objectPlayAnimation('keyfriend', 'singLEFT',true);
    
end

if noteType == 'keyfriend sing' and noteData == 1 then

	objectPlayAnimation('keyfriend', 'singDOWN',true);

end

if noteType == 'keyfriend sing' and noteData == 2 then

	objectPlayAnimation('keyfriend', 'singUP',true);

end

if noteType == 'keyfriend sing' and noteData == 3 then

	objectPlayAnimation('keyfriend', 'singRIGHT',true);

end

if noteType == 'keyfriend sing' and noteData == 4 then

	objectPlayAnimation('keyfriend', 'singUP',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote)

end


