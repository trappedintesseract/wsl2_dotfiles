local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("fen", {
    t({
      "template <typename T>",
      "struct Fenwick {",
      "  int n;",
      "  vector<T> bit;",
      "  Fenwick(int n) : n(n), bit(n + 1, 0) {}",
      "  void add(int i, T v) {",
      "    for (i++; i <= n; i += i & -i) bit[i] += v;",
      "  }",
      "  T prefix(int i) const {",
      "    T s = 0;",
      "    for (; i > 0; i -= i & -i) s += bit[i];",
      "    return s;",
      "  }",
      "  T range(int l, int r) const { return prefix(r) - prefix(l); }",
      "};",
    }),
  }),
})
