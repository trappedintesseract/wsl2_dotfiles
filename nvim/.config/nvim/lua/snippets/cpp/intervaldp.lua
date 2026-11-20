local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("intervaldp", {
    t({
      "template <typename CostF>",
      "long long interval_dp(int n, CostF cost) {",
      "  vector<vector<long long>> dp(n, vector<long long>(n, 0));",
      "  for (int len = 2; len <= n; len++)",
      "    for (int l = 0; l + len - 1 < n; l++) {",
      "      int r = l + len - 1;",
      "      dp[l][r] = LLONG_MAX;",
      "      for (int k = l; k < r; k++) {",
      "        long long cand = dp[l][k] + dp[k + 1][r] + cost(l, k, r);",
      "        if (cand < dp[l][r]) dp[l][r] = cand;",
      "      }",
      "    }",
      "  return n ? dp[0][n - 1] : 0;",
      "}",
    }),
  }),
})
