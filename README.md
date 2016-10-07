# Dynamic String Splitter - SA-MP

This include will facilitate the operation of splitting strings, in a dynamic way. This include generated from the fact of wanting a complete dynamic system, but at the end, this is what came out of it:

	sscanf(item_info, "p<|>iiiiiiiiiiiiiiiiiiii", aInventory[playerid][0][inventory_item_id], aInventory[playerid][0][inventory_item_extra], aInventory[playerid][1][inventory_item_id], aInventory[playerid][1][inventory_item_extra], aInventory[playerid][2][inventory_item_id], aInventory[playerid][2][inventory_item_extra], aInventory[playerid][3][inventory_item_id], aInventory[playerid][3][inventory_item_extra], aInventory[playerid][4][inventory_item_id], aInventory[playerid][4][inventory_item_extra], aInventory[playerid][5][inventory_item_id], aInventory[playerid][5][inventory_item_extra], aInventory[playerid][6][inventory_item_id], aInventory[playerid][6][inventory_item_extra], aInventory[playerid][7][inventory_item_id], aInventory[playerid][7][inventory_item_extra], aInventory[playerid][8][inventory_item_id], aInventory[playerid][8][inventory_item_extra], aInventory[playerid][9][inventory_item_id], aInventory[playerid][9][inventory_item_extra]);

The code above is obviously not dynamic. But with this include, that becomes (which is dynamic):

	new sscanf_format[30];
	SplitIntegers_IndexesEnum(string_to_split, "|", aInventory[playerid], "ii", "ii", sscanf_format);

Test code (simulating what's above):

	new string_to_split[] = "5|2|3|5|7|8|2|2|3|4|5|6|77|12|1|2|55|2|3|8", sscanf_format[30];

	enum eInventory
	{
		inventory_item_id,
		inventory_item_extra
	};

	new aInventory[MAX_PLAYERS][10][eInventory];

	SplitIntegers_IndexesEnum(string_to_split, "|", aInventory[0], "ii", "ii", sscanf_format);

	for(new i = 0; i < sizeof(aInventory[]); i ++)
	{
		for(new j = 0; j < _:eInventory; j ++)
		{
			printf("i: %d, j: %d - %d", i, j, aInventory[0][i][eInventory:j]);
		}
	}

In case your enumerator has elements in between (for this example, let's put one element in between the enumerator that we used previously - note that "ii" in the example above changes to "i-ii"), you can do:

	new string_to_split[] = "5|2|3|5|7|8|2|2|3|4|5|6|77|12|1|2|55|2|3|8", sscanf_format[32];

	enum eInventory
	{
		inventory_item_id,
		inventory_item_extra_1,
		inventory_item_extra_2
	};

	new aInventory[MAX_PLAYERS][10][eInventory];

	SplitIntegers_IndexesEnum(string_to_split, "|", aInventory[0], "i-ii", "ii", sscanf_format);

	for(new i = 0; i < sizeof(aInventory[]); i ++)
	{
		for(new j = 0; j < _:eInventory; j ++)
		{
			printf("i: %d, j: %d - %d", i, j, aInventory[0][i][eInventory:j]);
		}
	}

That's just one example, and the use of one function in this include. It has many other uses and plenty more useful functions.

The example script (dynamic_string_splitter_example.amx) and the include (dynamic_string_splitter.inc) requires:
* SSCANF: http://forum.sa-mp.com/showthread.php?t=602923
