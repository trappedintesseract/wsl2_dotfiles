local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("zfn", {
    t({
      "vector<int> z_function(const string &s) {",
      "  int n = (int)s.size();",
      "  vector<int> z(n, 0);",
      "  for (int i = 1, l = 0, r = 0; i < n; i++) {",
      "    if (i < r) z[i] = min(r - i, z[i - l]);",
      "    while (i + z[i] < n && s[z[i]] == s[i + z[i]]) z[i]++;",
      "    if (i + z[i] > r) {",
      "      l = i;",
      "      r = i + z[i];",
      "    }",
      "  }",
      "  return z;",
      "}",
    }),
  }),
})
