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

#if defined _dss_included
	#endinput
#endif

#define _dss_included

#if !defined sscanf
	#error "SSCANF could not be found"
#endif

// ** FUNCTIONS

stock SplitIntegers(const string_to_split[], const separator[], integers[], sscanf_format[], const size_of_1 = sizeof(integers), const size_of_2 = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitIntegers: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of_2, "p<%c>a<i>[%d]", separator, size_of_1);

		sscanf(string_to_split, sscanf_format, integers);
	}
	return 1;
}

stock SplitIntegers_Enum(const string_to_split[], const separator[], integers[], const enum_format[], sscanf_format[], const size_of = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitIntegers_Enum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of, "p<%c>e<%s>", separator, enum_format);

		sscanf(string_to_split, sscanf_format, integers);
	}
	return 1;
}

stock SplitIntegers_IndexesEnum(const string_to_split[], const separator[], integers[][], const enum_format[], const values_used_format[], sscanf_format[], const size_of_1 = sizeof(integers), const size_of_2 = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitIntegers_IndexesEnum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of_2, "p<%c>e<{}%s>", separator, enum_format);

		for(new i = 0; i < size_of_1; i ++)
		{
			sscanf(string_to_split, sscanf_format, integers[i]);

			strins(sscanf_format, values_used_format, 7, size_of_2);
		}
	}
	return 1;
}

stock SplitFloats(const string_to_split[], const separator[], Float:floats[], sscanf_format[], const size_of_1 = sizeof(floats), const size_of_2 = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitFloats: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of_2, "p<%c>a<f>[%d]", separator, size_of_1);

		sscanf(string_to_split, sscanf_format, floats);
	}
	return 1;
}

stock SplitFloats_Enum(const string_to_split[], const separator[], Float:floats[], const enum_format[], sscanf_format[], const size_of = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitFloats_Enum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of, "p<%c>e<%s>", separator, enum_format);

		sscanf(string_to_split, sscanf_format, floats);
	}
	return 1;
}

stock SplitFloats_IndexesEnum(const string_to_split[], const separator[], Float:floats[][], const enum_format[], const values_used_format[], sscanf_format[], const size_of_1 = sizeof(floats), const size_of_2 = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitFloats_IndexesEnum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of_2, "p<%c>e<{}%s>", separator, enum_format);

		for(new i = 0; i < size_of_1; i ++)
		{
			sscanf(string_to_split, sscanf_format, floats[i]);

			strins(sscanf_format, values_used_format, 7, size_of_2);
		}
	}
	return 1;
}

stock SplitStrings(const string_to_split[], const separator[], strings[][], sscanf_format[], const size_of_1 = sizeof(strings), const size_of_2 = sizeof(strings[]), const size_of_3 = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitStrings: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of_3, "p<%c>a<s[%d]>[%d]", separator, size_of_2, size_of_1);

		sscanf(string_to_split, sscanf_format, strings);
	}
	return 1;
}

stock SplitStrings_Enum(const string_to_split[], const separator[], strings[], const enum_format[], sscanf_format[], const size_of = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitStrings_Enum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of, "p<%c>e<%s>", separator, enum_format);

		sscanf(string_to_split, sscanf_format, strings);
	}
	return 1;
}

stock SplitStrings_IndexesEnum(const string_to_split[], const separator[], strings[][], const enum_format[], const values_used_format[], sscanf_format[], const size_of_1 = sizeof(strings), const size_of_2 = sizeof(sscanf_format), const size_of_3 = sizeof(string_to_split))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitStrings_IndexesEnum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of_2, "p<%c>e<{}%s{s[%d]}>", separator, enum_format, size_of_3);

		for(new i = 0; i < size_of_1; i ++)
		{
			sscanf(string_to_split, sscanf_format, strings[i]);

			strins(sscanf_format, values_used_format, 7, size_of_2);
		}
	}
	return 1;
}

stock Split_Enum(const string_to_split[], const separator[], array[], const enum_format[], sscanf_format[], const size_of = sizeof(sscanf_format))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | Split_Enum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of, "p<%c>e<%s>", separator, enum_format);

		sscanf(string_to_split, sscanf_format, array);
	}
	return 1;
}

stock Split_IndexesEnum(const string_to_split[], const separator[], array[][], const enum_format[], const values_used_format[], sscanf_format[], const size_of_1 = sizeof(array), const size_of_2 = sizeof(sscanf_format), const size_of_3 = sizeof(string_to_split))
{
	if(separator[1] != EOS)
	{
		print("Dynamic String Splitter | SplitStrings_IndexesEnum: Invalid separator (Minimum and maximum length: 1)");
	}
	else
	{
		format(sscanf_format, size_of_2, "p<%c>e<{}%s{s[%d]}>", separator, enum_format, size_of_3);

		for(new i = 0; i < size_of_1; i ++)
		{
			sscanf(string_to_split, sscanf_format, array[i]);

			strins(sscanf_format, values_used_format, 7, size_of_2);
		}
	}
	return 1;
}