local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("seg", {
    t({
      "template <typename T>",
      "struct SegTree {",
      "  int n;",
      "  T neutral;",
      "  function<T(T, T)> op;",
      "  vector<T> t;",
      "  SegTree(int n, T neutral, function<T(T, T)> op) : n(n), neutral(neutral), op(op), t(2 * n, neutral) {}",
      "  void set(int i, T v) {",
      "    t[i + n] = v;",
      "    for (i = (i + n) >> 1; i >= 1; i >>= 1) t[i] = op(t[2 * i], t[2 * i + 1]);",
      "  }",
      "  T query(int l, int r) const {",
      "    T resL = neutral, resR = neutral;",
      "    for (l += n, r += n; l < r; l >>= 1, r >>= 1) {",
      "      if (l & 1) resL = op(resL, t[l++]);",
      "      if (r & 1) resR = op(t[--r], resR);",
      "    }",
      "    return op(resL, resR);",
      "  }",
      "};",
    }),
  }),
})
