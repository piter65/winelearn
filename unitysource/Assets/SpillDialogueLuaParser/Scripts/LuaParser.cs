using UnityEngine;
using System.Collections;
using System;
using System.Text;
using System.IO;

public class LuaParser
{
	public string Load(string fileName)
	{
		// Handle any problems that might arise when reading the text
		try
		{
			StringBuilder strbResult = new StringBuilder();
			
			string line;
			// Create a new StreamReader, tell it which file to read and what encoding the file
			// was saved as
			StreamReader strmReader = new StreamReader(fileName, Encoding.Default);
			// Immediately clean up the reader after this block of code is done.
			// You generally use the "using" statement for potentially memory-intensive objects
			// instead of relying on garbage collection.
			// (Do not confuse this with the using directive for namespace at the 
			// beginning of a class!)
			using (strmReader)
			{
				// While there's lines left in the text file, do this:
				do
				{
					line = strmReader.ReadLine();
					
					if (line != null)
					{
						// Do whatever you need to do with the text line, it's a string now
						// In this example, I split it into arguments based on comma
						// deliniators, then send that array to DoStuff()
						// string[] entries = line.Split(',');
						// if (entries.Length > 0)
						// 	DoStuff(entries);
						
						strbResult.AppendLine(line);
					}
				}
				while (line != null);
				// Done reading, close the reader and return true to broadcast success    
				strmReader.Close();
				
				return strbResult.ToString();
			}
		}
		// If anything broke in the try block, we throw an exception with information
		// on what didn't work
		catch (Exception e)
		{
			Console.WriteLine("{0}\n", e.Message);
			return "ERROR: " + e.Message;
		}
	}
};
