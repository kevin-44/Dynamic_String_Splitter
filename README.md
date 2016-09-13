# Dynamic String Splitter - SA-MP

This include will facilitate the operation of splitting strings, in a dynamic way. This include generated from the fact of wanting a complete dynamic system, but at the end, this is what came out of it:

	sscanf(item_info, "p<|>iiiiiiiiiiiiiiiiiiii", aInventory[playerid][0][inventory_item_id], aInventory[playerid][0][inventory_item_extra], aInventory[playerid][1][inventory_item_id], aInventory[playerid][1][inventory_item_extra], aInventory[playerid][2][inventory_item_id], aInventory[playerid][2][inventory_item_extra], aInventory[playerid][3][inventory_item_id], aInventory[playerid][3][inventory_item_extra], aInventory[playerid][4][inventory_item_id], aInventory[playerid][4][inventory_item_extra], aInventory[playerid][5][inventory_item_id], aInventory[playerid][5][inventory_item_extra], aInventory[playerid][6][inventory_item_id], aInventory[playerid][6][inventory_item_extra], aInventory[playerid][7][inventory_item_id], aInventory[playerid][7][inventory_item_extra], aInventory[playerid][8][inventory_item_id], aInventory[playerid][8][inventory_item_extra], aInventory[playerid][9][inventory_item_id], aInventory[playerid][9][inventory_item_extra]);

The code above is obviously not dynamic. But with this include, that becomes (which is dynamic):

	new integers[MAX_INVENTORY_ITEMS], count[2];
	for(new i = 0, j = split_integers(item_info, "|", integers); i < j; i += sizeof(aInventory[][]))
	{
		for(new k = 0; k < sizeof(aInventory[][]); k ++)
		{
			aInventory[playerid][count[0]][eInventory:k] = integers[count[1] ++];
		}

		count[0] ++;
	}

That's just one way of converting that specific example to be dynamic, there are plenty more. It also has many other uses (such as loading server settings using the enumerator functions, or if necessary the global split function). Please check the example script to see the other functions this include has, and examples of each one.

The example script (dynamic_string_splitter_example.amx) and the include (dynamic_string_splitter.inc) requires:
* SSCANF: http://forum.sa-mp.com/showthread.php?t=602923
