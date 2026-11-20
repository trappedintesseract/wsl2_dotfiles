local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("manacher", {
    t({
      "pair<vector<int>, vector<int>> manacher(const string &s) {",
      "  int n = (int)s.size();",
      "  vector<int> odd(n, 0), even(n, 0);",
      "  for (int i = 0, l = 0, r = -1; i < n; i++) {",
      "    int k = (i > r) ? 1 : min(odd[l + r - i], r - i + 1);",
      "    while (i - k >= 0 && i + k < n && s[i - k] == s[i + k]) k++;",
      "    odd[i] = k - 1;",
      "    if (i + odd[i] > r) {",
      "      l = i - odd[i];",
      "      r = i + odd[i];",
      "    }",
      "  }",
      "  for (int i = 0, l = 0, r = -1; i < n; i++) {",
      "    int k = (i > r) ? 0 : min(even[l + r - i + 1], r - i + 1);",
      "    while (i - k - 1 >= 0 && i + k < n && s[i - k - 1] == s[i + k]) k++;",
      "    even[i] = k;",
      "    if (i + even[i] - 1 > r) {",
      "      l = i - even[i];",
      "      r = i + even[i] - 1;",
      "    }",
      "  }",
      "  return {odd, even};",
      "}",
    }),
  }),
})
