local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("sqrtdecomp", {
    t({
      "template <typename T>",
      "struct SqrtDecomp {",
      "  int n, B;",
      "  vector<T> a, block;",
      "  SqrtDecomp(const vector<T> &arr) : n((int)arr.size()), a(arr) {",
      "    B = max(1, (int)sqrt((double)n));",
      "    block.assign((n + B - 1) / B, 0);",
      "    for (int i = 0; i < n; i++) block[i / B] += a[i];",
      "  }",
      "  void add(int i, T v) {",
      "    a[i] += v;",
      "    block[i / B] += v;",
      "  }",
      "  T query(int l, int r) const {",
      "    T res = 0;",
      "    int bl = l / B, br = r / B;",
      "    if (bl == br) {",
      "      for (int i = l; i <= r; i++) res += a[i];",
      "      return res;",
      "    }",
      "    for (int i = l; i < (bl + 1) * B; i++) res += a[i];",
      "    for (int b = bl + 1; b < br; b++) res += block[b];",
      "    for (int i = br * B; i <= r; i++) res += a[i];",
      "    return res;",
      "  }",
      "};",
    }),
  }),
})
