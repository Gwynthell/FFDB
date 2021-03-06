﻿/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../../common/socket.h"
#include "../../common/utils.h"

#include <string.h>

#include "char_check.h"

#include "../entities/charentity.h"
#include "../utils/itemutils.h"
#include "../vana_time.h"


CCheckPacket::CCheckPacket(CCharEntity* PChar, CCharEntity* PTarget) 
{
	this->type = 0xC9;
	this->size = 0x06;

	WBUFL(data,(0x04)-4) = PTarget->id;
	WBUFW(data,(0x08)-4) = PTarget->targid;

	WBUFB(data,(0x0A)-4) = 0x03;

	uint8 count = 0;

	for (int32 i = 0; i < 16; ++i) 
	{
		if (PTarget->equip[i] != 0) 
		{
			CItem* PItem = PTarget->getStorage(LOC_INVENTORY)->GetItem(PTarget->equip[i]);

			if (PItem != NULL) 
			{
				WBUFW(data,(size*2+0x00)-4) = PItem->getID();
				WBUFB(data,(size*2+0x02)-4) = i;

				if (PItem->isSubType(ITEM_CHARGED))
				{
                    uint32 currentTime = CVanaTime::getInstance()->getVanaTime();
					uint32 nextUseTime = ((CItemUsable*)PItem)->getLastUseTime() + ((CItemUsable*)PItem)->getReuseDelay();

					WBUFB(data,(size*2+0x04)-4) = 0x01;													
					WBUFB(data,(size*2+0x05)-4) = ((CItemUsable*)PItem)->getCurrentCharges(); 
					WBUFB(data,(size*2+0x07)-4) = (nextUseTime > currentTime ? 0x90 : 0xD0); 

					WBUFL(data,(size*2+0x08)-4) = nextUseTime;												
					WBUFL(data,(size*2+0x0C)-4) = ((CItemUsable*)PItem)->getUseDelay() + currentTime;		
				}

				memcpy(data+(size*2+0x10)-4, PItem->getSignature(), dsp_cap(strlen(PItem->getSignature()), 0, 12));

				this->size += 0x0E;
				count++;

				if (count == 8)
				{
					WBUFB(data,(0x0B)-4) = count;

					PChar->pushPacket(new CBasicPacket(*this));

					this->size = 0x06;
					memset(data+(0x0B)-4, 0, sizeof(data)-7);
				}
			}
		}
	}

	if (count == 0)
	{
		this->size = 0x14;
		PChar->pushPacket(new CBasicPacket(*this));
	}
	else if (count != 8) 
	{
		WBUFB(data,(0x0B)-4) = (count > 8 ? count - 8 : count);
		PChar->pushPacket(new CBasicPacket(*this));
	}

	this->size = 0x28;
	memset(data+(0x0B)-4, 0, sizeof(data)-7);

	WBUFB(data,(0x0A)-4) = 0x01;

    if (PTarget->equip[SLOT_LINK] != 0)
    {
        CItemLinkshell* PLinkshell = (CItemLinkshell*)PTarget->getStorage(LOC_INVENTORY)->GetItem(PTarget->equip[SLOT_LINK]);

        if ((PLinkshell != NULL) && PLinkshell->isType(ITEM_LINKSHELL))
	    {
          //WBUFW(data,(0x0C)-4) = PLinkshell->GetLSID(); 
            WBUFW(data,(0x0E)-4) = PLinkshell->getID();
            WBUFW(data,(0x10)-4) = PLinkshell->GetLSRawColor();

	        memcpy(data+(0x14)-4, PLinkshell->getSignature(), dsp_cap(strlen(PLinkshell->getSignature()), 0, 15));
        }
    }
	if ((PChar->nameflags.flags & FLAG_GM) || !(PTarget->nameflags.flags & FLAG_ANON)) 
	{
		WBUFB(data,(0x12)-4) = PTarget->GetMJob();
		WBUFB(data,(0x13)-4) = PTarget->GetSJob();
		WBUFB(data,(0x23)-4) = PTarget->GetMLevel();
		WBUFB(data,(0x24)-4) = PTarget->GetSLevel();
	}

	//Chevron 32 bit Big Endean, starting at 0x2B
	//WBUFB(data,(0x2C)-4) = 0x00;	//Ballista Star next to Chevron count
}