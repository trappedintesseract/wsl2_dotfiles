local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("floyd", {
    t({
      "vector<vector<long long>> floyd_warshall(int n, vector<vector<long long>> d) {",
      "  for (int k = 1; k <= n; k++)",
      "    for (int i = 1; i <= n; i++)",
      "      for (int j = 1; j <= n; j++)",
      "        if (d[i][k] + d[k][j] < d[i][j]) d[i][j] = d[i][k] + d[k][j];",
      "  return d;",
      "}",
    }),
  }),
})
