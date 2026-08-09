local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {

  s("zfunc", {
    t({
      "vector<int> z_function(const string &s) {",
      "    int n = s.size();",
      "    vector<int> z(n);",
      "    int l = 0, r = 0;",
      "",
      "    for (int i = 1; i < n; i++) {",
      "        if (i <= r)",
      "            z[i] = min(r - i + 1, z[i - l]);",
      "",
      "        while (i + z[i] < n && s[z[i]] == s[i + z[i]])",
      "            z[i]++;",
      "",
      "        if (i + z[i] - 1 > r) {",
      "            l = i;",
      "            r = i + z[i] - 1;",
      "        }",
      "    }",
      "    return z;",
      "}",
    }),
  }),
})
