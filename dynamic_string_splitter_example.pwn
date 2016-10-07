// ** INCLUDES

#include <a_samp>
#include <sscanf2>
#include <dynamic_string_splitter>

// ** DIRECTIVES

#pragma dynamic 100000

// ** MAIN

main()
{
	print("Loaded \"dynamic_string_splitter_example.amx\".");

	// ***** SplitIntegers *****

	/*new string_to_split[] = "5|2|3|5|7|8|2|2|3|4|5|6|77|12", integers[14], sscanf_format[13];
	SplitIntegers(string_to_split, "|", integers, sscanf_format);

	for(new i = 0; i < sizeof(integers); i ++)
	{
		printf("%d", integers[i]);
	}*/

	// ***** SplitIntegers_Enum *****

	/*new string_to_split[] = "5|3|5|4", sscanf_format[14];

	enum eIntegers
	{
		integer_1,
		integer_2,
		integer_3,
		integer_4,
		integer_5
	};

	new aIntegers[eIntegers];

	SplitIntegers_Enum(string_to_split, "|", aIntegers, "i-iiii", sscanf_format);

	for(new i = 0; i < _:eIntegers; i ++)
	{
		printf("%d", aIntegers[eIntegers:i]);
	}*/

	// ***** SplitIntegers_IndexesEnum *****

	/*new string_to_split[] = "5|2|3|5|7|8|2|2|3|4|5|6|77|12|5|2|3|5|7|8|2|2|3|4|5|6|77|12", sscanf_format[40];

	enum eIntegers
	{
		integer_1,
		integer_2,
		integer_3
	};

	new aIntegers[14][eIntegers];

	SplitIntegers_IndexesEnum(string_to_split, "|", aIntegers, "i-ii", "ii", sscanf_format);

	for(new i = 0; i < sizeof(aIntegers); i ++)
	{
		for(new j = 0; j < _:eIntegers; j ++)
		{
			printf("i: %d, j: %d - %d", i, j, aIntegers[i][eIntegers:j]);
		}
	}*/

	// ***** SplitFloats *****

	/*new string_to_split[] = "5.0|2.0|3.0|5.0|7.0|8.0|2.0|2.0|3.0|4.0|5.0|6.0|77.0|12.0", Float:floats[14], sscanf_format[13];
	SplitFloats(string_to_split, "|", floats, sscanf_format);

	for(new i = 0; i < sizeof(floats); i ++)
	{
		printf("%.2f", floats[i]);
	}*/

	// ***** SplitFloats_Enum *****

	/*new string_to_split[] = "5.0|3.0|5.0|4.0", sscanf_format[14];

	enum eFloats
	{
		float_1,
		float_2,
		float_3,
		float_4,
		float_5
	};

	new Float:aFloats[eFloats];

	SplitFloats_Enum(string_to_split, "|", aFloats, "f-ffff", sscanf_format);

	for(new i = 0; i < _:eFloats; i ++)
	{
		printf("%.2f", aFloats[eFloats:i]);
	}*/

	// ***** SplitFloats_IndexesEnum *****

	/*new string_to_split[] = "5|2|3|5|7|8|2|2|3|4|5|6|77|12|5|2|3|5|7|8|2|2|3|4|5|6|77|12", sscanf_format[40];

	enum eFloats
	{
		float_1,
		float_2,
		float_3
	};

	new Float:aFloats[14][eFloats];

	SplitFloats_IndexesEnum(string_to_split, "|", aFloats, "f-ff", "ff", sscanf_format);

	for(new i = 0; i < sizeof(aFloats); i ++)
	{
		for(new j = 0; j < _:eFloats; j ++)
		{
			printf("i: %d, j: %d - %.2f", i, j, aFloats[i][eFloats:j]);
		}
	}*/

	// ***** SplitStrings *****

	/*new string_to_split[] = "hi there|yo man sup|hello", strings[3][11], sscanf_format[16];
	SplitStrings(string_to_split, "|", strings, sscanf_format);

	for(new i = 0; i < sizeof(strings); i ++)
	{
		printf("%s", strings[i]);
	}*/

	// ***** SplitStrings_Enum *****

	/*new string_to_split[] = "hi there|yo man sup|hello", sscanf_format[26];

	enum eStrings
	{
		string_1[9],
		string_2[5],
		string_3[11],
		string_4[6]
	};

	new aStrings[eStrings];

	SplitStrings_Enum(string_to_split, "|", aStrings, "s[9]-s[5]s[11]s[6]", sscanf_format);

	printf("%s", aStrings[string_1]);
	printf("%s", aStrings[string_2]);
	printf("%s", aStrings[string_3]);
	printf("%s", aStrings[string_4]);*/

	// ***** SplitStrings_IndexesEnum *****

	/*new string_to_split[] = "aa|bb|cc|dd|ee|ff|gg|hh|ii|jj", sscanf_format[62];

	enum eStrings
	{
		string_1[3],
		string_2[3],
		string_3[3]
	};

	new aStrings[5][eStrings];

	SplitStrings_IndexesEnum(string_to_split, "|", aStrings, "s[3]-s[3]s[3]", "s[3]s[3]", sscanf_format);

	for(new i = 0; i < sizeof(aStrings); i ++)
	{
		printf("i: %d - %s", i, aStrings[i][string_1]);
		printf("i: %d - %s", i, aStrings[i][string_2]);
		printf("i: %d - %s", i, aStrings[i][string_3]);
	}*/

	// ***** Split_Enum *****

	/*new string_to_split[] = "hi there|5|20.0", sscanf_format[16];

	enum eArray
	{
		string_1[9],
		integer_1,
		integer_2,
		Float:float_1
	};

	new aArray[eArray];

	Split_Enum(string_to_split, "|", aArray, "s[9]-iif", sscanf_format);

	printf("%s", aArray[string_1]);
	printf("%d", aArray[integer_1]);
	printf("%d", aArray[integer_2]);
	printf("%.2f", aArray[float_1]);*/

	// ***** SplitStrings_IndexesEnum *****

	/*new string_to_split[] = "hi there|5|20.0|hai|20|50.0|yo yo|5000|1.0", sscanf_format[38];

	enum eArray
	{
		string_1[9],
		integer_1,
		integer_2,
		Float:float_1
	};

	new aArray[3][eArray];

	Split_IndexesEnum(string_to_split, "|", aArray, "s[9]-iif", "s[9]if", sscanf_format);

	for(new i = 0; i < sizeof(aArray); i ++)
	{
		printf("i: %d - %s", i, aArray[i][string_1]);
		printf("i: %d - %d", i, aArray[i][integer_1]);
		printf("i: %d - %d", i, aArray[i][integer_2]);
		printf("i: %d - %.2f", i, aArray[i][float_1]);
	}*/
}

// ** CALLBACKS

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	return 1;
}