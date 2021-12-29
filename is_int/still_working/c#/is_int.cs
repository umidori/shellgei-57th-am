using System;

class program {
    static bool IsInt(string s) {
        var l = s.Length;
		var i = 0;

        goto S0;
S0:
        if (i >= l) {
            goto S4;
        } else if (s[i] == '+' || s[i] == '-') {
			i++;
            goto S1;
        } else if ('0' <= s[i] && s[i] <= '9') {
			i++;
            goto S2;
        } else {
            goto S4;
        }
S1:
S2: 
S3:
        return true;
S4:
        return false;
    }

    static void Main() {
        (string s, bool b)[] tests = {
            ("", false),
            (" ", false),
            ("+", false),
            ("-", false),
            ("++", false),
            ("--", false),
            ("+0+", false),
            ("-0-", false),
            ("+0123456789", true),
            ("-0123456789", true),
            ("0123456789", true)
        };

        foreach (var t in tests) {
            Console.WriteLine("{0}\t'{1}'", t.b == IsInt(t.s) ? "OK" : "NG", t.s);
        }

    }
}
