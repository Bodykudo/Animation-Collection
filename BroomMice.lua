wizardImg={}
p={}
wizard={
	normal={
		right={
			{"15950cb5244",-38.5,-33},
			{"15950cc4277",-38.5,-33},
			{"15950cd2d1f",-38.5,-33},
			{"15950ce2a35",-38.5,-33},
			{"15950ce52fd",-38.5,-33},
			{"15950ce67ee",-38.5,-33},
			{"15950ce7b26",-38.5,-33},
			{"15950ce8e78",-38.5,-33},
			{"15950cea22a",-38.5,-33},
			{"15950cb69b4",-38.5,-33},
			{"15950cb7ce0",-38.5,-33},
			{"15950cb90f1",-38.5,-33},
			{"15950cba609",-38.5,-33},
			{"15950cbba03",-38.5,-33},
			{"15950cbce29",-38.5,-33},
			{"15950cbe77b",-38.5,-33},
			{"15950cbfc97",-38.5,-33},
			{"15950cc1487",-38.5,-33},
			{"15950cc2b1d",-38.5,-33},
			{"15950cc55d7",-38.5,-33},
			{"15950cc6db5",-38.5,-33},
			{"15950cc840e",-38.5,-33},
			{"15950cc9a70",-38.5,-33},
			{"15950ccb040",-38.5,-33},
			{"15950ccc5c9",-38.5,-33},
			{"15950ccd9af",-38.5,-33},
			{"15950ccef27",-38.5,-33},
			{"15950cd034f",-38.5,-33},
			{"15950cd19a4",-38.5,-33},
			{"15950cd47cc",-38.5,-33},
			{"15950cd5c0f",-38.5,-33},
			{"15950cd6ec3",-38.5,-33},
			{"15950cd84b4",-38.5,-33},
			{"15950cd9b65",-38.5,-33},
			{"15950cdb108",-38.5,-33},
			{"15950cdc6ac",-38.5,-33},
			{"15950cddb5f",-38.5,-33},
			{"15950cdef8c",-38.5,-33},
			{"15950ce0641",-38.5,-33},
			{"15950ce3dec",-38.5,-33}
		},
		left={
			{"15950f7708e",-38.5,-33},
			{"15950f8610a",-38.5,-33},
			{"15950f94119",-38.5,-33},
			{"15950fa1ec5",-38.5,-33},
			{"15950fa4870",-38.5,-33},
			{"15950fa5da6",-38.5,-33},
			{"15950fa72ac",-38.5,-33},
			{"15950fa87b3",-38.5,-33},
			{"15950fa9ce8",-38.5,-33},
			{"15950f78819",-38.5,-33},
			{"15950f7a684",-38.5,-33},
			{"15950f7bf25",-38.5,-33},
			{"15950f7d357",-38.5,-33},
			{"15950f7e9b4",-38.5,-33},
			{"15950f7fe65",-38.5,-33},
			{"15950f8127c",-38.5,-33},
			{"15950f8285b",-38.5,-33},
			{"15950f83b77",-38.5,-33},
			{"15950f84e14",-38.5,-33},
			{"15950f87403",-38.5,-33},
			{"15950f886b0",-38.5,-33},
			{"15950f899f6",-38.5,-33},
			{"15950f8ad54",-38.5,-33},
			{"15950f8c120",-38.5,-33},
			{"15950f8d518",-38.5,-33},
			{"15950f8ea02",-38.5,-33},
			{"15950f904fe",-38.5,-33},
			{"15950f9189c",-38.5,-33},
			{"15950f92d23",-38.5,-33},
			{"15950f954ae",-38.5,-33},
			{"15950f96844",-38.5,-33},
			{"15950f97b5d",-38.5,-33},
			{"15950f98e47",-38.5,-33},
			{"15950f9a354",-38.5,-33},
			{"15950f9b6ea",-38.5,-33},
			{"15950f9ce9e",-38.5,-33},
			{"15950f9e16e",-38.5,-33},
			{"15950f9f6df",-38.5,-33},
			{"15950fa0a42",-38.5,-33},
			{"15950fa32db",-38.5,-33}
		}
	},
	walking={
		right={
			{"15950a1eae0",-38.5,-33},
			{"15950a2054f",-38.5,-33},
			{"15950a222ba",-38.5,-33},
			{"15950a23a9e",-38.5,-33},
			{"15950a252fc",-38.5,-33},
			{"15950a269de",-38.5,-33},
			{"15950a283bc",-38.5,-33},
			{"15950a29a8e",-38.5,-33},
			{"15950a2b3ba",-38.5,-33}
		},
		left={
			{"15950aa9c5d",-38.5,-33},
			{"15950aab01c",-38.5,-33},
			{"15950aac49f",-38.5,-33},
			{"15950aadd20",-38.5,-33},
			{"15950aaf349",-38.5,-33},
			{"15950ab0b87",-38.5,-33},
			{"15950ab20be",-38.5,-33},
			{"15950ab375a",-38.5,-33},
			{"15950ab53bf",-38.5,-33}
		}
	}
}

function eventNewPlayer(n)
	p[n]={state="normal",id=0,right=true}
	system.bindKeyboard(n,32,true)
end

function eventNewGame()
	for n in pairs(tfm.get.room.playerList) do
		p[n].state="normal"
		p[n].right=true
	end
end

function eventKeyboard(n,k,d,x,y)
	tfm.exec.movePlayer(n,0,0,false,0,-40,false)
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
			p[n].id=p[n].id+1 > #wizard[p[n].state].right and 1 or (p[n].id+1)
			if wizardImg[n] then
				tfm.exec.removeImage(wizardImg[n])
				wizardImg[n]=nil
			end
			wizardImg[n]=tfm.exec.addImage(wizard[p[n].state][p[n].right and "right" or "left"][p[n].id][1]..".png","%"..n,wizard[p[n].state][p[n].right and "right" or "left"][p[n].id][2], wizard[p[n].state][p[n].right and "right" or "left"][p[n].id][3])
		end
	end,1000+t,true)
end
tfm.exec.newGame()
