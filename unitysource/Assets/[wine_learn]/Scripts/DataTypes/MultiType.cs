using UnityEngine;
using System;

public enum MultiTypeType
{
	UNKNOWN,
	STRING,
	INT,
	BOOL
};

public struct MultiType
{
	public MultiTypeType type;
	public string str;
	public int i;
	public bool b;

	private static MultiType _UNKNOWN = new MultiType(MultiTypeType.UNKNOWN);
	public static MultiType UNKNOWN
	{
		get { return _UNKNOWN; }
	}

	public bool IsUnknown
	{
		get { return type == MultiTypeType.UNKNOWN; }
	}
	public bool IsInt
	{
		get { return type == MultiTypeType.INT; }
	}
	public bool IsString
	{
		get { return type == MultiTypeType.STRING; }
	}
	public bool IsBool
	{
		get { return type == MultiTypeType.BOOL; }
	}

	public MultiType(MultiTypeType enType)
	{
		type = enType;
		str = null;
		i = 0;
		b = false;
	}

	public MultiType(int iValue)
	{
		type = MultiTypeType.INT;
		str = iValue.ToString();
		i = iValue;
		b = iValue != 0;
	}

	public MultiType(string strValue)
	{
		i = 0;
		str = strValue;
		b = false;

		// If the string is an integer, set the type to int.
		if (Int32.TryParse(strValue, out i))
		{
			type = MultiTypeType.INT;
			b = i != 0;
		}
		// If the string is a boolean value, set the type to bool
		else if (Boolean.TryParse(strValue, out b))
		{
			type = MultiTypeType.BOOL;
			i = b ? 1 : 0;
		}
		// Otherwise, set the type to string.
		else
		{
			type = MultiTypeType.STRING;
		}
	}

	public MultiType(bool bValue)
	{
		type = MultiTypeType.BOOL;
		str = bValue.ToString();
		i = bValue ? 1 : 0;
		b = bValue;
	}

	public override string ToString()
	{
		if (IsString)
			return str;
		else if (IsInt)
			return i.ToString();
		else if (IsBool)
			return b.ToString();
		else
			return null;
	}

	public override bool Equals(object obj)
	{
		if (obj is int)
			return i == (int)obj;
		else if (obj is bool)
			return b == (bool)obj;
		else if (obj is string)
			return str.Equals((string)obj);
		else if (obj is MultiType)
			return this == (MultiType)obj;
		else if (obj == null)
			return str == null;
		else
			return false;
	}

	public override int GetHashCode()
	{
		return
			  type.GetHashCode()
			+ i.GetHashCode()
			+ str.GetHashCode()
			+ b.GetHashCode();
	}

	// Allow assignment of integer values.
	public static implicit operator MultiType(int iValue)
	{
		return new MultiType(iValue);
	}

	// Allow assignment of string values.
	public static implicit operator MultiType(string strValue)
	{
		return new MultiType(strValue);
	}

	// Allow assignment of bool values.
	public static implicit operator MultiType(bool bValue)
	{
		return new MultiType(bValue);
	}

	public static bool operator ==(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i == b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return a.str.Equals(b.str);
		}
		else if (a.IsBool && b.IsBool)
		{
			return a.b == b.b;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			return true;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator !=(MultiType a, MultiType b)
	{
		return !(a == b);
	}

	public static bool operator ==(MultiType a, int b)
	{
		if (a.IsInt)
		{
			return a.i == b;
		}

		Debug.LogError(string.Format("Comparing MultiType of type {0} with {1} is not supported.", a.type.ToString(), b.GetType()));
		return false;
	}

	public static bool operator !=(MultiType a, int b)
	{
		return !(a == b);
	}

	public static bool operator ==(MultiType a, bool b)
	{
		if (a.IsBool)
		{
			return a.b == b;
		}

		//Debug.LogError(string.Format("Comparing MultiType of type {0} with {1} is not supported.", a.type.ToString(), b.GetType()));
		return false;
	}

	public static bool operator !=(MultiType a, bool b)
	{
		return !(a == b);
	}

	public static bool operator >(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i > b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) > 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator <(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i < b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) < 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator >=(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i >= b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) >= 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			return a.b == b.b;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			return true;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator <=(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i <= b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) <= 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			return a.b == b.b;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			return true;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static MultiType operator +(MultiType a, MultiType b)
	{
		//Debug.LogError(string.Format("Adding MultiType: {0} and MultiType: {1}", a, b));
		if (a.IsInt && b.IsInt)
		{
			//Debug.LogError(string.Format("Adding MultiTypes as Integers"));
			return new MultiType(a.i + b.i);
		}
		else if (a.IsString && b.IsString)
		{
			//Debug.LogError(string.Format("Adding MultiTypes as Strings"));
			return new MultiType(a.str + b.str);
		}
		else
		{
			Debug.LogError(string.Format("Adding MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}

	public static MultiType operator -(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return new MultiType(a.i - b.i);
		}
		else
		{
			Debug.LogError(string.Format("Subtracting MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}

	public static MultiType operator *(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return new MultiType(a.i * b.i);
		}
		else
		{
			Debug.LogError(string.Format("Multiplying MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}

	public static MultiType operator /(MultiType a, MultiType b)
	{
		if (a.IsInt && b.IsInt)
		{
			return new MultiType(a.i / b.i);
		}
		else
		{
			Debug.LogError(string.Format("Dividing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}
};