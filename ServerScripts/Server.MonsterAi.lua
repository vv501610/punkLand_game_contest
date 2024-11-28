function firstAttack(enemy,ai,event,data)
    if (event == 0) then -- 2초마다 실행되는 이벤트
    
        --맵에 플레이어가 하나도 없을 경우 null로 세팅
        if enemy.field.playerCount <=0 then
            ai.SetTargetUnit(nil)
            
        -- 타깃이 없거나 기존 타깃이던 유닛이 맵을 나갔거나 x 또는 y값 차이의 절댓값이 300을 넘어서면
        -- 타깃을 nil로 초기화하고 200 범위 내에서 타깃을 설정
        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 1600) 
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 1600) then
            
            -- if ai.GetTargetUnit() ~= nil then
            --     enemy.say('타깃이 사라졌군...')
            -- end
            
            ai.SetFollowTarget(false) --타깃이 사라지면 추적 비활성화
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 1500)

            -- 주변 탐색 후 타깃 발견 시(nil이 아니면), 추적 활성화(true), 메세지 출력
            if ai.GetTargetUnit() ~= nil then 
                ai.SetFollowTarget(true) 
                enemy.say('타깃 발견! \n추적 시작!')
            end
        end
        
        -- --타깃 존재 시 타깃을 향해 스킬 10번 발사
        -- if ai.GetTargetUnit() ~= nil then
        --     ai.UseSkill(10)
        -- end
        
        --타깃 부재 시 예외 처리
        if ai.GetTargetUnit() == nil then
            return
        end
        
    end
    
    if (event == 1) then -- 몬스터가 공격을 받을 때마다 실행되는 이벤트
        --공격한 유닛이 없을 경우 예외 처리
        if ai.GetAttackedUnit() == nil then
            return
        else

        end
    end
        
end

Server.SetMonsterAI(0, firstAttack) -- 1번 몬스터에게 firstAttack 적용