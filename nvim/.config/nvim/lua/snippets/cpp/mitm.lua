local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("mitm", {
    t({
      "long long count_subsets_with_sum(const vector<long long> &a, long long target) {",
      "  int n = (int)a.size(), h = n / 2;",
      "  auto sums = [&](int from, int to) {",
      "    vector<long long> out;",
      "    int len = to - from;",
      "    for (int mask = 0; mask < (1 << len); mask++) {",
      "      long long s = 0;",
      "      for (int i = 0; i < len; i++)",
      "        if ((mask >> i) & 1) s += a[from + i];",
      "      out.push_back(s);",
      "    }",
      "    return out;",
      "  };",
      "  vector<long long> L = sums(0, h), R = sums(h, n);",
      "  sort(R.begin(), R.end());",
      "  long long res = 0;",
      "  for (long long x : L) {",
      "    auto lo = lower_bound(R.begin(), R.end(), target - x);",
      "    auto hi = upper_bound(R.begin(), R.end(), target - x);",
      "    res += hi - lo;",
      "  }",
      "  return res;",
      "}",
    }),
  }),
})
