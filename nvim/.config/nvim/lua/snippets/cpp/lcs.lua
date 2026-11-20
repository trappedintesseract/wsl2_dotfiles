local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("lcs", {
    t({
      "int lcs_length(const string &a, const string &b) {",
      "  int n = (int)a.size(), m = (int)b.size();",
      "  vector<int> prev(m + 1, 0), cur(m + 1, 0);",
      "  for (int i = 1; i <= n; i++) {",
      "    for (int j = 1; j <= m; j++)",
      "      cur[j] = (a[i - 1] == b[j - 1]) ? prev[j - 1] + 1 : max(prev[j], cur[j - 1]);",
      "    swap(prev, cur);",
      "  }",
      "  return prev[m];",
      "}",
      "",
      "string lcs_string(const string &a, const string &b) {",
      "  int n = (int)a.size(), m = (int)b.size();",
      "  vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));",
      "  for (int i = 1; i <= n; i++)",
      "    for (int j = 1; j <= m; j++)",
      "      dp[i][j] = (a[i - 1] == b[j - 1]) ? dp[i - 1][j - 1] + 1 : max(dp[i - 1][j], dp[i][j - 1]);",
      "  string res;",
      "  int i = n, j = m;",
      "  while (i > 0 && j > 0) {",
      "    if (a[i - 1] == b[j - 1]) { res.push_back(a[i - 1]); i--; j--; }",
      "    else if (dp[i - 1][j] >= dp[i][j - 1]) i--;",
      "    else j--;",
      "  }",
      "  reverse(res.begin(), res.end());",
      "  return res;",
      "}",
    }),
  }),
})
