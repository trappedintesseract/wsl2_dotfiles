local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("fen2d", {
    t({
      "template <typename T>",
      "struct Fenwick2D {",
      "  int n, m;",
      "  vector<vector<T>> bit;",
      "  Fenwick2D(int n, int m) : n(n), m(m), bit(n + 1, vector<T>(m + 1, 0)) {}",
      "  void add(int x, int y, T v) {",
      "    for (int i = x + 1; i <= n; i += i & -i)",
      "      for (int j = y + 1; j <= m; j += j & -j) bit[i][j] += v;",
      "  }",
      "  T prefix(int x, int y) const {",
      "    T s = 0;",
      "    for (int i = x; i > 0; i -= i & -i)",
      "      for (int j = y; j > 0; j -= j & -j) s += bit[i][j];",
      "    return s;",
      "  }",
      "  T rect(int x1, int y1, int x2, int y2) const {",
      "    return prefix(x2, y2) - prefix(x1, y2) - prefix(x2, y1) + prefix(x1, y1);",
      "  }",
      "};",
    }),
  }),
})
