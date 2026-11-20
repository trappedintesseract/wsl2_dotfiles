local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("cht", {
    t({
      "struct CHT {",
      "  vector<long long> M, B;",
      "  static bool bad(long long m1, long long b1, long long m2, long long b2, long long m3, long long b3) {",
      "    return (__int128)(b3 - b1) * (m1 - m2) <= (__int128)(b2 - b1) * (m1 - m3);",
      "  }",
      "  void add(long long m, long long b) {",
      "    if (!M.empty() && M.back() == m) {",
      "      if (B.back() <= b) return;",
      "      M.pop_back();",
      "      B.pop_back();",
      "    }",
      "    while (M.size() >= 2 &&",
      "           bad(M[M.size() - 2], B[B.size() - 2], M.back(), B.back(), m, b)) {",
      "      M.pop_back();",
      "      B.pop_back();",
      "    }",
      "    M.push_back(m);",
      "    B.push_back(b);",
      "  }",
      "  long long query(long long x) const {",
      "    int lo = 0, hi = (int)M.size() - 1;",
      "    while (lo < hi) {",
      "      int mid = (lo + hi) / 2;",
      "      if (M[mid] * x + B[mid] <= M[mid + 1] * x + B[mid + 1]) hi = mid;",
      "      else lo = mid + 1;",
      "    }",
      "    return M[lo] * x + B[lo];",
      "  }",
      "};",
    }),
  }),
})
