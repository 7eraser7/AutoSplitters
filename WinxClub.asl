state("WinxClub")
{
	// Thanks to Abahbob for these values.
	byte currentLevel : 0x0355294, 0x1B0;
	byte previousLevel : 0x0355294, 0x1B4;
	byte currentState : 0x0355294, 0x1B8;
}

init
{

}

startup
{
	
}

start
{
	//Detecting if the game has started from the main menu.
	if(current.currentLevel == 0x01 && current.previousLevel == 0x4A)
		return true;
}

reset
{
	//Detecting if the game is loading the first level.
	if(current.currentLevel == 0x01 && current.currentState == 0x01)
		return true;
}

split
{
	switch (timer.CurrentSplitIndex)
	{
		/* 00 - Gardenia Level */
		case 0: return current.currentLevel == 0x03 && current.previousLevel == 0x4A && current.currentState == 0x00;
		
		/* 01 - Knut Fight */
		case 1: return current.currentLevel == 0x46 && current.previousLevel == 0x1B && current.currentState == 0x00;
		
		/* 02 - Alfea 1 (until the start of Swamp Level) */
		case 2: return current.currentLevel == 0x46 && current.previousLevel == 0x09 && current.currentState == 0x00;
		
		/* 03 - Swamp Level */
		case 3: return current.currentLevel == 0x0D && current.previousLevel == 0x4A && current.currentState == 0x00;
		
		/* 04 - Troll Fight */
		case 4: return current.currentLevel == 0x1C && current.previousLevel == 0x0D && current.currentState == 0x1C;
		
		/* 05 - Cloud Towers 1 */
		case 5: return current.currentLevel == 0x10 && current.previousLevel == 0x4A && current.currentState == 0x00;
		
		/* 06 - Slime Fight */
		case 6: return current.currentLevel == 0x46 && current.previousLevel == 0x1E && current.currentState == 0x00;
		
		/* 07 - Alfea 2 (until the start of Red Fountain Level) */
		case 7: return current.currentLevel == 0x46 && current.previousLevel == 0x17 && current.currentState == 0x00;
		
		/* 08 - Red Fountain Level */
		case 8: return current.currentLevel == 0x24 && current.previousLevel == 0x4A && current.currentState == 0x00;
		
		/* 09 - Darcy & Stormy Fight */
		case 9: return current.currentLevel == 0x1D && current.previousLevel == 0x24 && current.currentState == 0x1D;
		
		/* 10 - Sparks Level */
		case 10: return current.currentLevel == 0x08 && current.previousLevel == 0x4A && current.currentState == 0x00;
		
		/* 11 - Yeti Fight */
		case 11: return current.currentLevel == 0x21 && current.previousLevel == 0x08 && current.currentState == 0x00;
		
		/* 12 - Cloud Towers 2 (until escaping with Brandon) */
		case 12: return current.currentLevel == 0x46 && current.previousLevel == 0x28 && current.currentState == 0x00;
		
		/* 13 - Icy Fight */
		case 13: return current.currentLevel == 0x38 && current.previousLevel == 0x3C && current.currentState == 0x38;
	}
}

isLoading
{
	// Stop the timer when the state of the game = the current level.
	// That means that the game is currently loading.
    if(current.currentState == current.currentLevel)
		return true;
	else
		return false;
}