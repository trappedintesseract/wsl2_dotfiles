local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("knuth", {
    t({
      "template <typename CostF>",
      "long long knuth_dp(int n, CostF cost) {",
      "  vector<vector<long long>> dp(n, vector<long long>(n, 0));",
      "  vector<vector<int>> opt(n, vector<int>(n, 0));",
      "  for (int i = 0; i < n; i++) opt[i][i] = i;",
      "  for (int len = 2; len <= n; len++)",
      "    for (int l = 0; l + len - 1 < n; l++) {",
      "      int r = l + len - 1;",
      "      dp[l][r] = LLONG_MAX;",
      "      int lo = opt[l][r - 1], hi = min(opt[l + 1][r], r - 1);",
      "      for (int k = lo; k <= hi; k++) {",
      "        long long cand = dp[l][k] + dp[k + 1][r] + cost(l, r);",
      "        if (cand < dp[l][r]) {",
      "          dp[l][r] = cand;",
      "          opt[l][r] = k;",
      "        }",
      "      }",
      "    }",
      "  return n ? dp[0][n - 1] : 0;",
      "}",
    }),
  }),
})
