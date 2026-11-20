local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("floorsum", {
    t({
      "long long floor_sum(long long n, long long m, long long a, long long b) {",
      "  long long ans = 0;",
      "  while (true) {",
      "    if (a >= m) {",
      "      ans += (n - 1) * n / 2 * (a / m);",
      "      a %= m;",
      "    }",
      "    if (b >= m) {",
      "      ans += n * (b / m);",
      "      b %= m;",
      "    }",
      "    long long y_max = a * n + b;",
      "    if (y_max < m) break;",
      "    n = y_max / m;",
      "    b = y_max % m;",
      "    swap(m, a);",
      "  }",
      "  return ans;",
      "}",
    }),
  }),
})
