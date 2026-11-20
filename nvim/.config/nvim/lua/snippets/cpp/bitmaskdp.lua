local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bitmaskdp", {
    t({
      "long long min_cost_assignment(int n, const vector<vector<long long>> &cost) {",
      "  int full = 1 << n;",
      "  vector<long long> dp(full, LLONG_MAX);",
      "  dp[0] = 0;",
      "  for (int mask = 0; mask < full; mask++) {",
      "    if (dp[mask] == LLONG_MAX) continue;",
      "    int job = __builtin_popcount(mask);",
      "    if (job == n) continue;",
      "    for (int w = 0; w < n; w++)",
      "      if (!((mask >> w) & 1)) {",
      "        long long cand = dp[mask] + cost[job][w];",
      "        if (cand < dp[mask | (1 << w)]) dp[mask | (1 << w)] = cand;",
      "      }",
      "  }",
      "  return dp[full - 1];",
      "}",
    }),
  }),
})
