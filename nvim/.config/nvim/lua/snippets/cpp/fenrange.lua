local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("fenrange", {
    t({
      "template <typename T>",
      "struct FenwickRange {",
      "  int n;",
      "  vector<T> b1, b2;",
      "  FenwickRange(int n) : n(n), b1(n + 1, 0), b2(n + 1, 0) {}",
      "  void add_at(vector<T> &b, int i, T v) {",
      "    for (i++; i <= n; i += i & -i) b[i] += v;",
      "  }",
      "  T sum_at(const vector<T> &b, int i) const {",
      "    T s = 0;",
      "    for (; i > 0; i -= i & -i) s += b[i];",
      "    return s;",
      "  }",
      "  void range_add(int l, int r, T v) {",
      "    add_at(b1, l, v);",
      "    add_at(b2, l, v * (T)l);",
      "    if (r < n) {",
      "      add_at(b1, r, -v);",
      "      add_at(b2, r, -v * (T)r);",
      "    }",
      "  }",
      "  T prefix(int i) const { return sum_at(b1, i) * (T)i - sum_at(b2, i); }",
      "  T range(int l, int r) const { return prefix(r) - prefix(l); }",
      "};",
    }),
  }),
})
