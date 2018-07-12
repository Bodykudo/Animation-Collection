catImg={}
p={}
cat={
	normal={
		right={
			{"156ae5efc27",-22,-48.5},
			{"156ae5f7c0c",-22,-48.5},
			{"156ae5fbd13",-22,-48.5},
			{"156ae602c90",-22,-48.5},
			{"156ae60659a",-22,-48.5},
			{"156ae609050",-22,-48.5},
			{"156ae62ae47",-22,-48.5},
			{"156ae60cac3",-22,-48.5},
			{"156ae61029c",-22,-48.5},
			{"156ae613add",-22,-48.5},
			{"156ae627b0f",-22,-48.5},
			{"156ae62ae47",-22,-48.5},
			{"156ae62ae47",-22,-48.5},
			{"156ae627b0f",-22,-48.5},
			{"156ae613add",-22,-48.5},
			{"156ae61029c",-22,-48.5},
			{"156ae60cac3",-22,-48.5},
			{"156ae62ae47",-22,-48.5},
			{"156ae609050",-22,-48.5},
			{"156ae60659a",-22,-48.5},
			{"156ae602c90",-22,-48.5},
			{"156ae5fbd13",-22,-48.5},
			{"156ae5f7c0c",-22,-48.5},
			{"156ae5efc27",-22,-48.5}
		},
		left={
			{"156ae5bc729",-22,-48.5},
			{"156ae5c043c",-22,-48.5},
			{"156ae5c4729",-22,-48.5},
			{"156ae5c88da",-22,-48.5},
			{"156ae5cbbec",-22,-48.5},
			{"156ae5cf94c",-22,-48.5},
			{"156ae5d3397",-22,-48.5},
			{"156ae5d64ac",-22,-48.5},
			{"156ae5d9042",-22,-48.5},
			{"156ae5dc52b",-22,-48.5},
			{"156ae5def97",-22,-48.5},
			{"156ae5e26d1",-22,-48.5},
			{"156ae5e26d1",-22,-48.5},
			{"156ae5def97",-22,-48.5},
			{"156ae5dc52b",-22,-48.5},
			{"156ae5d9042",-22,-48.5},
			{"156ae5d64ac",-22,-48.5},
			{"156ae5d3397",-22,-48.5},
			{"156ae5cf94c",-22,-48.5},
			{"156ae5cbbec",-22,-48.5},
			{"156ae5c88da",-22,-48.5},
			{"156ae5c4729",-22,-48.5},
			{"156ae5c043c",-22,-48.5},
			{"156ae5bc729",-22,-48.5}
		}
	},
	walking={
		right={
			{"156ae48afdd",-45.5,-48.5},
			{"156ae48f084",-45.5,-48.5},
			{"156ae492919",-45.5,-48.5},
			{"156ae49781e",-45.5,-48.5},
			{"156ae49adf3",-45.5,-48.5},
			{"156ae49dcb1",-45.5,-48.5},
			{"156ae4a1554",-45.5,-48.5},
			{"156ae4b4dd5",-45.5,-48.5},
			{"156ae4b87b9",-45.5,-48.5},
			{"156ae4b87b9",-45.5,-48.5},
			{"156ae4be84e",-45.5,-48.5},
			{"156ae4d0d97",-45.5,-48.5}
		},
		left={
			{"156ae4ff2ef",-45.5,-48.5},
			{"156ae50263c",-45.5,-48.5},
			{"156ae505f33",-45.5,-48.5},
			{"156ae5093ab",-45.5,-48.5},
			{"156ae50c83f",-45.5,-48.5},
			{"156ae51045f",-45.5,-48.5},
			{"156ae514d86",-45.5,-48.5},
			{"156ae519cb2",-45.5,-48.5},
			{"156ae519cb2",-45.5,-48.5},
			{"156ae5239e2",-45.5,-48.5},
			{"156ae52003a",-45.5,-48.5},
			{"156ae5239e2",-45.5,-48.5}
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
			p[n].id=p[n].id+1 > #cat[p[n].state].right and 1 or (p[n].id+1)
			if catImg[n] then
				tfm.exec.removeImage(catImg[n])
				catImg[n]=nil
			end
			catImg[n]=tfm.exec.addImage(cat[p[n].state][p[n].right and "right" or "left"][p[n].id][1]..".png","%"..n,cat[p[n].state][p[n].right and "right" or "left"][p[n].id][2], cat[p[n].state][p[n].right and "right" or "left"][p[n].id][3])
		end
	end,1000+t,true)
end
tfm.exec.newGame()
