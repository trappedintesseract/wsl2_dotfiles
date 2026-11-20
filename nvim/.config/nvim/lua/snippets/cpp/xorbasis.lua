local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("xorbasis", {
    t({
      "struct XorBasis {",
      "  static const int LOG = 62;",
      "  array<long long, LOG> b;",
      "  XorBasis() { b.fill(0); }",
      "  bool insert(long long x) {",
      "    for (int i = LOG - 1; i >= 0; i--) {",
      "      if (!((x >> i) & 1)) continue;",
      "      if (!b[i]) { b[i] = x; return true; }",
      "      x ^= b[i];",
      "    }",
      "    return false;",
      "  }",
      "  bool can(long long x) const {",
      "    for (int i = LOG - 1; i >= 0; i--)",
      "      if ((x >> i) & 1) {",
      "        if (!b[i]) return false;",
      "        x ^= b[i];",
      "      }",
      "    return true;",
      "  }",
      "  long long max_xor() const {",
      "    long long r = 0;",
      "    for (int i = LOG - 1; i >= 0; i--) r = max(r, r ^ b[i]);",
      "    return r;",
      "  }",
      "  long long count() const {",
      "    int k = 0;",
      "    for (int i = 0; i < LOG; i++) if (b[i]) k++;",
      "    return 1LL << k;",
      "  }",
      "};",
    }),
  }),
})
