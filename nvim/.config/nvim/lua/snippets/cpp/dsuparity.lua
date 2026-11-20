local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("dsuparity", {
    t({
      "struct DSUWeight {",
      "  vector<int> p, sz;",
      "  vector<long long> w;",
      "  DSUWeight(int n) : p(n + 1), sz(n + 1, 1), w(n + 1, 0) { iota(p.begin(), p.end(), 0); }",
      "  pair<int, long long> find(int x) {",
      "    if (p[x] == x) return {x, 0};",
      "    auto got = find(p[x]);",
      "    w[x] += got.second;",
      "    p[x] = got.first;",
      "    return {p[x], w[x]};",
      "  }",
      "  bool unite(int a, int b, long long d) {",
      "    auto fa = find(a), fb = find(b);",
      "    int ra = fa.first, rb = fb.first;",
      "    long long wa = fa.second, wb = fb.second;",
      "    if (ra == rb) return (wa - wb) == d;",
      "    long long wrb = wa - wb - d;",
      "    if (sz[ra] < sz[rb]) {",
      "      swap(ra, rb);",
      "      wrb = -wrb;",
      "    }",
      "    p[rb] = ra;",
      "    w[rb] = wrb;",
      "    sz[ra] += sz[rb];",
      "    return true;",
      "  }",
      "  pair<bool, long long> diff(int a, int b) {",
      "    auto fa = find(a), fb = find(b);",
      "    if (fa.first != fb.first) return {false, 0};",
      "    return {true, fa.second - fb.second};",
      "  }",
      "};",
    }),
  }),
})
