mouseImg={}
p={}
mouse={
	normal={
		right={
			{"159a71ce8ba",-21.5,-30},
			{"159a71db7c2",-21.5,-30},
			{"159a71e7b34",-21.5,-30},
			{"159a71ee3eb",-21.5,-30},
			{"159a71f024d",-21.5,-30},
			{"159a71f137a",-21.5,-30},
			{"159a71f24cf",-21.5,-30},
			{"159a71f374a",-21.5,-30},
			{"159a71f4940",-21.5,-30},
			{"159a71cfb09",-21.5,-30},
			{"159a71d0cdd",-21.5,-30},
			{"159a71d1ec5",-21.5,-30},
			{"159a71d30c6",-21.5,-30},
			{"159a71d42b4",-21.5,-30},
			{"159a71d53f3",-21.5,-30},
			{"159a71d65b6",-21.5,-30},
			{"159a71d7983",-21.5,-30},
			{"159a71d8cd7",-21.5,-30},
			{"159a71da69d",-21.5,-30},
			{"159a71dc921",-21.5,-30},
			{"159a71dda59",-21.5,-30},
			{"159a71ded67",-21.5,-30},
			{"159a71dff46",-21.5,-30},
			{"159a71e1071",-21.5,-30},
			{"159a71e2308",-21.5,-30},
			{"159a71e3432",-21.5,-30},
			{"159a71e459e",-21.5,-30},
			{"159a71e5744",-21.5,-30},
			{"159a71e68c3",-21.5,-30},
			{"159a71e8c83",-21.5,-30},
			{"159a71e9e8c",-21.5,-30},
			{"159a71eafd1",-21.5,-30},
			{"159a71ec172",-21.5,-30},
			{"159a71ed293",-21.5,-30}
		},
		left={
			{"159a7237eed",-21.5,-30},
			{"159a72442c6",-21.5,-30},
			{"159a7250724",-21.5,-30},
			{"159a7257447",-21.5,-30},
			{"159a7258621",-21.5,-30},
			{"159a7259938",-21.5,-30},
			{"159a725ab63",-21.5,-30},
			{"159a725bf16",-21.5,-30},
			{"159a725d3d0",-21.5,-30},
			{"159a72390e2",-21.5,-30},
			{"159a723a37a",-21.5,-30},
			{"159a723b4b9",-21.5,-30},
			{"159a723c5eb",-21.5,-30},
			{"159a723d743",-21.5,-30},
			{"159a723e8f1",-21.5,-30},
			{"159a723fab7",-21.5,-30},
			{"159a7240cb9",-21.5,-30},
			{"159a7241f43",-21.5,-30},
			{"159a72430a9",-21.5,-30},
			{"159a724549a",-21.5,-30},
			{"159a7246721",-21.5,-30},
			{"159a72478e7",-21.5,-30},
			{"159a7248a9a",-21.5,-30},
			{"159a7249c16",-21.5,-30},
			{"159a724ae04",-21.5,-30},
			{"159a724bfc4",-21.5,-30},
			{"159a724d231",-21.5,-30},
			{"159a724e3af",-21.5,-30},
			{"159a724f539",-21.5,-30},
			{"159a7251b4b",-21.5,-30},
			{"159a7252c7a",-21.5,-30},
			{"159a7253e50",-21.5,-30},
			{"159a7255006",-21.5,-30},
			{"159a725621b",-21.5,-30}
		}
	},
	walking={
		right={
			{"159a731316a",-41,-40},
			{"159a731673a",-41,-40},
			{"159a731788e",-41,-40},
			{"159a7318a17",-41,-40},
			{"159a7319ba2",-41,-40},
			{"159a731ad9c",-41,-40},
			{"159a731beff",-41,-40},
			{"159a731d08c",-41,-40},
			{"159a731e234",-41,-40},
			{"159a7314373",-41,-40},
			{"159a731557a",-41,-40}
		},
		left={
		    {"159a72d2ebe",-41,-40},
		    {"159a72d7791",-41,-40},
		    {"159a72daec0",-41,-40},
		    {"159a72dd255",-41,-40},
		    {"159a72df724",-41,-40},
		    {"159a72e0f54",-41,-40},
		    {"159a72e3406",-41,-40},
		    {"159a72e5837",-41,-40},
		    {"159a72e707e",-41,-40},
		    {"159a72d4718",-41,-40},
		    {"159a72d5fdc",-41,-40}
		}
	}
}

function eventNewPlayer(n)
	p[n]={state="normal",id=0,right=true}
end

function eventNewGame()
	for n in pairs(tfm.get.room.playerList) do
		p[n].state="normal"
		p[n].right=true
	end
end
table.foreach(tfm.get.room.playerList,eventNewPlayer)

for t=0, 966.7, 33.3 do
	system.newTimer(function()
		for n in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[n].isJumping or tfm.get.room.playerList[n].movingRight or tfm.get.room.playerList[n].movingLeft then
				p[n].state="walking"
			else
				p[n].state="normal"
			end
			if tfm.get.room.playerList[n].movingRight or tfm.get.room.playerList[n].isFacingRight then
				p[n].right=true
			elseif tfm.get.room.playerList[n].movingLeft or not tfm.get.room.playerList[n].isFacingRight then
				p[n].right=false
			end
			p[n].id=p[n].id+1 > #mouse[p[n].state].right and 1 or (p[n].id+1)
			if mouseImg[n] then
				tfm.exec.removeImage(mouseImg[n])
				mouseImg[n]=nil
			end
			mouseImg[n]=tfm.exec.addImage(mouse[p[n].state][p[n].right and "right" or "left"][p[n].id][1]..".png","%"..n,mouse[p[n].state][p[n].right and "right" or "left"][p[n].id][2], mouse[p[n].state][p[n].right and "right" or "left"][p[n].id][3])
		end
	end,1000+t,true)
end
tfm.exec.newGame()
