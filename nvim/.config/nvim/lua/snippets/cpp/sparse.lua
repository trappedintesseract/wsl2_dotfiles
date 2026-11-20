local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("sparse", {
    t({
      "template <typename T>",
      "struct SparseTable {",
      "  int n, LOG;",
      "  vector<vector<T>> st;",
      "  SparseTable(const vector<T> &a) : n((int)a.size()) {",
      "    LOG = 1;",
      "    while ((1 << LOG) <= n) LOG++;",
      "    st.assign(LOG, vector<T>(n));",
      "    st[0] = a;",
      "    for (int k = 1; k < LOG; k++)",
      "      for (int i = 0; i + (1 << k) <= n; i++) st[k][i] = min(st[k - 1][i], st[k - 1][i + (1 << (k - 1))]);",
      "  }",
      "  T query(int l, int r) const {",
      "    int k = 31 - __builtin_clz(r - l);",
      "    return min(st[k][l], st[k][r - (1 << k)]);",
      "  }",
      "};",
    }),
  }),
})
