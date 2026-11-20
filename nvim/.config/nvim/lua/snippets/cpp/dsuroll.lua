local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("dsuroll", {
    t({
      "struct DSURollback {",
      "  vector<int> p, sz;",
      "  vector<pair<int, int>> hist;",
      "  DSURollback(int n) : p(n + 1), sz(n + 1, 1) { iota(p.begin(), p.end(), 0); }",
      "  int find(int x) const {",
      "    while (p[x] != x) x = p[x];",
      "    return x;",
      "  }",
      "  int time() const { return (int)hist.size(); }",
      "  bool unite(int a, int b) {",
      "    a = find(a);",
      "    b = find(b);",
      "    if (a == b) return false;",
      "    if (sz[a] < sz[b]) swap(a, b);",
      "    hist.push_back({b, a});",
      "    p[b] = a;",
      "    sz[a] += sz[b];",
      "    return true;",
      "  }",
      "  void rollback(int t) {",
      "    while ((int)hist.size() > t) {",
      "      auto [b, a] = hist.back();",
      "      hist.pop_back();",
      "      p[b] = b;",
      "      sz[a] -= sz[b];",
      "    }",
      "  }",
      "  bool same(int a, int b) const { return find(a) == find(b); }",
      "};",
    }),
  }),
})
