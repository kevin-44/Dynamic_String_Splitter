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

#if !defined strcpy
	#define strcpy(%0,%1,%2) strcat((%0[0] = '\0', %0), %1, %2)
#endif

// ** FUNCTIONS

stock split_integers(string_to_split[], const separator[], integers[])
{
	new _format[20], count = 1;
	for(new i = 0, j = strlen(string_to_split); i <= j; i ++)
	{
		if(string_to_split[i] == separator[0])
		{
			string_to_split[i] = ' ';
			count ++;
		}
	}

	format(_format, sizeof(_format), "a<i>[%d]", count);

	sscanf(string_to_split, _format, integers);
	return count;
}

stock split_floats(string_to_split[], const separator[], Float:floats[])
{
	new _format[20], count = 1;
	for(new i = 0, j = strlen(string_to_split); i <= j; i ++)
	{
		if(string_to_split[i] == separator[0])
		{
			string_to_split[i] = ' ';
			count ++;
		}
	}

	format(_format, sizeof(_format), "a<f>[%d]", count);

	sscanf(string_to_split, _format, floats);
	return count;
}

stock split_strings(string_to_split[], const separator[], strings[][], size_of = sizeof(strings[]))
{
	new _format[22], count = 1;
	for(new i = 0, j = strlen(string_to_split); i <= j; i ++)
	{
		if(string_to_split[i] == ' ')
		{
			strins(string_to_split, "\\", i, size_of);

			i ++;
			j ++;
		}
		else if(string_to_split[i] == separator[0])
		{
			string_to_split[i] = ' ';
			count ++;
		}
	}

	format(_format, sizeof(_format), "a<s[75]>[%d]", count);

	sscanf(string_to_split, _format, strings);
	return count;
}

stock split_integers_enum(string_to_split[], const separator[], integers[], size_of_enum = sizeof(integers))
{
	new _format[50] = "e<", index = 2, count = 1;
	for(new i = 0, j = strlen(string_to_split); i <= j; i ++)
	{
		if(string_to_split[i] == separator[0])
		{
			string_to_split[i] = ' ';
			count ++;
		}
	}

	for(new i = 0; i < size_of_enum; i ++)
	{
		_format[index ++] = 'i';
	}

	_format[index] = '>';

	sscanf(string_to_split, _format, integers);
	return count;
}

stock split_floats_enum(string_to_split[], const separator[], Float:floats[], size_of_enum = sizeof(floats))
{
	new _format[50] = "e<", index = 2, count = 1;
	for(new i = 0, j = strlen(string_to_split); i <= j; i ++)
	{
		if(string_to_split[i] == separator[0])
		{
			string_to_split[i] = ' ';
			count ++;
		}
	}

	for(new i = 0; i < size_of_enum; i ++)
	{
		_format[index ++] = 'f';
	}

	_format[index] = '>';

	sscanf(string_to_split, _format, floats);
	return count;
}

stock split(const string_to_split[], const separator[], integers[], Float:floats[], strings[][], data_type_count[])
{
	new pos, last_pos, temp[30];
	for(;;)
	{
		last_pos = pos;
		pos = strfind(string_to_split, separator, true, (pos + 1));

		strmid(temp, string_to_split, ((!last_pos) ? (0) : (last_pos + 1)), pos);

		if(sscanf(temp, "i", integers[data_type_count[0]]))
		{
			if(sscanf(temp, "f", floats[data_type_count[1]]))
			{
				if(temp[0] != EOS)
				{
					strcpy(strings[data_type_count[2]], temp, 30);

					data_type_count[2] ++;
				}
			}
			else
			{
				data_type_count[1] ++;
			}
		}
		else
		{
			data_type_count[0] ++;
		}

		if(pos == -1)
		{
			if(data_type_count[0] > 1 || data_type_count[1] > 1 || data_type_count[2] > 1)
			{
				strmid(temp, string_to_split, (last_pos + 1), strlen(string_to_split));

				if(sscanf(temp, "i", integers[data_type_count[0]]))
				{
					if(sscanf(temp, "f", floats[data_type_count[1]]))
					{
						if(temp[0] != EOS)
						{
							strcpy(strings[data_type_count[2]], temp, 30);

							data_type_count[2] ++;
						}
					}
					else
					{
						data_type_count[1] ++;
					}
				}
				else
				{
					data_type_count[0] ++;
				}
			}
			break;
		}
	}
	return 1;
}