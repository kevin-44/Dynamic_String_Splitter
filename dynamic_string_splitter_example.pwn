/*
	Dynamic String Splitter ~ Kevin-Reinke

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

// ** INCLUDES

#include <a_samp>
#include <sscanf2>
#include <dynamic_string_splitter>

// ** MAIN

main()
{
	print("Loaded \"dynamic_string_splitter_example.amx\".");
}

// ** CALLBACKS

public OnGameModeInit()
{
	// ** 1D EXAMPLES

	new string_1[] = "11|22|33|44|55|66", integers_1[6];
	for(new i = 0, j = split_integers(string_1, "|", integers_1); i < j; i ++)
	{
		printf("[1D split_integers] Integer #%d: %d", (i + 1), integers_1[i]);
	}

	print(" ");

	new string_2[] = "11.500000|22.500000|33.500000|44.500000|55.500000|66.500000", Float:floats_1[6];
	for(new i = 0, j = split_floats(string_2, "|", floats_1); i < j; i ++)
	{
		printf("[1D split_floats] Float #%d: %f", (i + 1), floats_1[i]);
	}

	print(" ");

	new string_3[] = "hello there|hai|what's up?|car|cat|dog", strings_1[6][12];
	for(new i = 0, j = split_strings(string_3, "|", strings_1); i < j; i ++)
	{
		printf("[1D split_strings] String #%d: %s", (i + 1), strings_1[i]);
	}

	print(" ");

	enum eData_1
	{
		data_1_int_1,
		data_1_int_2
	}

	#pragma unused data_1_int_1
	#pragma unused data_1_int_2

	new string_4[] = "11|22", integers_2[eData_1];
	for(new i = 0, j = split_integers_enum(string_4, "|", integers_2); i < j; i ++)
	{
		printf("[1D split_integers_enum] Integer #%d: %d", (i + 1), integers_2[eData_1:i]);
	}

	print(" ");

	enum eData_2
	{
		Float:data_2_float_1,
		Float:data_2_float_2
	}

	#pragma unused data_2_float_1
	#pragma unused data_2_float_2

	new string_5[] = "11.500000|22.500000", Float:floats_2[eData_2];
	for(new i = 0, j = split_floats_enum(string_5, "|", floats_2); i < j; i ++)
	{
		printf("[1D split_floats_enum] Float #%d: %f", (i + 1), floats_2[eData_2:i]);
	}

	print(" ");

	new string_6[] = "hey mate|50.20|20|potato|5|20.20", integers_3[2], Float:floats_3[2], strings_3[2][12], count_1[3];
	split(string_6, "|", integers_3, floats_3, strings_3, count_1);

	for(new i = 0; i < count_1[0]; i ++)
	{
		printf("[1D split] Integer #%d: %d", (i + 1), integers_3[i]);
	}

	for(new i = 0; i < count_1[1]; i ++)
	{
		printf("[1D split] Float #%d: %f", (i + 1), floats_3[i]);
	}

	for(new i = 0; i < count_1[2]; i ++)
	{
		printf("[1D split] String #%d: %s", (i + 1), strings_3[i]);
	}

	// ** 2D EXAMPLES

	print(" ");

	new string_7[] = "11|22|33|44|55|66", integers_4[3][6], k_1 = split_integers(string_7, "|", integers_4[1]);
	for(new i = 0; i < sizeof(integers_4); i ++)
	{
		for(new j = 0; j < k_1; j ++)
		{
			printf("[2D split_integers] 1D: %d, 2D: Integer #%d: %d", (i + 1), (j + 1), integers_4[i][j]);
		}
	}

	print(" ");

	new string_8[] = "11.500000|22.500000|33.500000|44.500000|55.500000|66.500000", Float:floats_4[3][6], k_2 = split_floats(string_8, "|", floats_4[2]);
	for(new i = 0; i < sizeof(floats_4); i ++)
	{
		for(new j = 0; j < k_2; j ++)
		{
			printf("[2D split_floats] 1D: %d, 2D: Float #%d: %f", (i + 1), (j + 1), floats_4[i][j]);
		}
	}

	print(" ");

	new string_9[] = "hello there|hai|what's up?|car|cat|dog", strings_4[3][6][12], k_3 = split_strings(string_9, "|", strings_4[0]);
	for(new i = 0; i < sizeof(strings_4); i ++)
	{
		for(new j = 0; j < k_3; j ++)
		{
			printf("[2D split_strings] 1D: %d, 2D: String #%d: %s", (i + 1), (j + 1), strings_4[i][j]);
		}
	}

	print(" ");

	new string_10[] = "hey mate|50.20|20|potato|5|20.20", integers_5[3][2], Float:floats_5[3][2], strings_5[3][2][12], count_2[3];
	split(string_10, "|", integers_5[0], floats_5[1], strings_5[2], count_2);

	for(new i = 0; i < sizeof(integers_5); i ++)
	{
		for(new j = 0; j < count_2[0]; j ++)
		{
			printf("[2D split] 1D: %d, 2D: Integer #%d: %d", (i + 1), (j + 1), integers_5[i][j]);
		}
	}

	for(new i = 0; i < sizeof(floats_5); i ++)
	{
		for(new j = 0; j < count_2[1]; j ++)
		{
			printf("[2D split] 1D: %d, 2D: Float #%d: %f", (i + 1), (j + 1), floats_5[i][j]);
		}
	}

	for(new i = 0; i < sizeof(strings_5); i ++)
	{
		for(new j = 0; j < count_2[1]; j ++)
		{
			printf("[2D split] 1D: %d, 2D: String #%d: %s", (i + 1), (j + 1), strings_5[i][j]);
		}
	}

	print(" ");

	enum eData_3
	{
		data_3_int_1,
		data_3_int_2
	}

	#pragma unused data_3_int_1
	#pragma unused data_3_int_2

	new string_11[] = "11|22", integers_6[3][eData_3], k_4 = split_integers_enum(string_11, "|", integers_6[1]);
	for(new i = 0; i < sizeof(integers_6); i ++)
	{
		for(new j = 0; j < k_4; j ++)
		{
			printf("[2D split_integers_enum] 1D: %d, 2D: Integer #%d: %d", (i + 1), (j + 1), integers_6[i][eData_3:j]);
		}
	}

	print(" ");

	enum eData_4
	{
		Float:data_4_int_1,
		Float:data_4_int_2
	}

	#pragma unused data_4_int_1
	#pragma unused data_4_int_2

	new string_12[] = "11.500000|22.500000", Float:floats_6[3][eData_4], k_5 = split_floats_enum(string_12, "|", floats_6[0]);
	for(new i = 0; i < sizeof(floats_6); i ++)
	{
		for(new j = 0; j < k_5; j ++)
		{
			printf("[2D split_floats_enum] 1D: %d, 2D: Float #%d: %f", (i + 1), (j + 1), floats_6[i][eData_4:j]);
		}
	}

	// ** 3D EXAMPLES

	// *** Follow the 2D examples to use these functions with 3D arrays
	return 1;
}

public OnGameModeExit()
{
	return 1;
}