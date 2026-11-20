local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("knapsack", {
    t({
      "long long knapsack01(const vector<int> &weight, const vector<long long> &value, int cap) {",
      "  vector<long long> dp(cap + 1, 0);",
      "  for (int i = 0; i < (int)weight.size(); i++)",
      "    for (int c = cap; c >= weight[i]; c--) dp[c] = max(dp[c], dp[c - weight[i]] + value[i]);",
      "  return dp[cap];",
      "}",
      "",
      "long long knapsack_unbounded(const vector<int> &weight, const vector<long long> &value, int cap) {",
      "  vector<long long> dp(cap + 1, 0);",
      "  for (int c = 0; c <= cap; c++)",
      "    for (int i = 0; i < (int)weight.size(); i++)",
      "      if (weight[i] <= c) dp[c] = max(dp[c], dp[c - weight[i]] + value[i]);",
      "  return dp[cap];",
      "}",
    }),
  }),
})
