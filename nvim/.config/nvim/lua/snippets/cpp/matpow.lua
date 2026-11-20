local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("matpow", {
    t({
      "using Mat = vector<vector<long long>>;",
      "",
      "Mat mat_identity(int n) {",
      "  Mat r(n, vector<long long>(n, 0));",
      "  for (int i = 0; i < n; i++) r[i][i] = 1;",
      "  return r;",
      "}",
      "",
      "Mat mat_mul(const Mat &a, const Mat &b, long long mod) {",
      "  int n = (int)a.size(), k = (int)b.size(), m = (int)b[0].size();",
      "  Mat c(n, vector<long long>(m, 0));",
      "  for (int i = 0; i < n; i++)",
      "    for (int t = 0; t < k; t++) {",
      "      if (a[i][t] == 0) continue;",
      "      for (int j = 0; j < m; j++) c[i][j] = (c[i][j] + a[i][t] * b[t][j]) % mod;",
      "    }",
      "  return c;",
      "}",
      "",
      "Mat mat_pow(Mat a, long long e, long long mod) {",
      "  int n = (int)a.size();",
      "  Mat r = mat_identity(n);",
      "  while (e > 0) {",
      "    if (e & 1) r = mat_mul(r, a, mod);",
      "    a = mat_mul(a, a, mod);",
      "    e >>= 1;",
      "  }",
      "  return r;",
      "}",
    }),
  }),
})
