local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("kruskal", {
    t({
      "template <typename E>",
      "pair<long long, vector<array<long long, 3>>> kruskal(int n, E edges) {",
      "  sort(edges.begin(), edges.end(), [](auto &a, auto &b) { return a[2] < b[2]; });",
      "  vector<int> p(n + 1);",
      "  iota(p.begin(), p.end(), 0);",
      "  auto find = [&](auto &&self, int x) -> int { return p[x] == x ? x : p[x] = self(self, p[x]); };",
      "  long long total = 0;",
      "  vector<array<long long, 3>> chosen;",
      "  for (auto &e : edges) {",
      "    int u = find(find, (int)e[0]), v = find(find, (int)e[1]);",
      "    if (u != v) {",
      "      p[u] = v;",
      "      total += e[2];",
      "      chosen.push_back(e);",
      "    }",
      "  }",
      "  return {total, chosen};",
      "}",
    }),
  }),
})
