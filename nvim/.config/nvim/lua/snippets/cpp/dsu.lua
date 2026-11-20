local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("dsu", {
    t({
      "struct DSU {",
      "  vector<int> p, w;",
      "  DSU(int n) : p(n + 1), w(n + 1, 1) { iota(p.begin(), p.end(), 0); }",
      "  int find(int x) { return p[x] == x ? x : p[x] = find(p[x]); }",
      "  bool unite(int a, int b) {",
      "    a = find(a);",
      "    b = find(b);",
      "    if (a == b) return false;",
      "    if (w[a] < w[b]) swap(a, b);",
      "    p[b] = a;",
      "    w[a] += w[b];",
      "    return true;",
      "  }",
      "  bool same(int a, int b) { return find(a) == find(b); }",
      "  int component_size(int x) { return w[find(x)]; }",
      "};",
    }),
  }),
})
