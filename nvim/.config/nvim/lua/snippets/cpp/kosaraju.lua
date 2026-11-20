local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("kosaraju", {
    t({
      "template <typename G>",
      "vector<vector<int>> kosaraju(int n, const G &adj) {",
      "  vector<vector<int>> rg(n + 1);",
      "  for (int u = 1; u <= n; u++)",
      "    for (int v : adj[u]) rg[v].push_back(u);",
      "  vector<int> vis(n + 1, 0), order, comp(n + 1, -1);",
      "  auto go = [&](auto &&self, int u) -> void {",
      "    vis[u] = 1;",
      "    for (int v : adj[u])",
      "      if (!vis[v]) self(self, v);",
      "    order.push_back(u);",
      "  };",
      "  for (int u = 1; u <= n; u++)",
      "    if (!vis[u]) go(go, u);",
      "  vector<vector<int>> comps;",
      "  auto paint = [&](auto &&self, int u, int c) -> void {",
      "    comp[u] = c;",
      "    comps[c].push_back(u);",
      "    for (int v : rg[u])",
      "      if (comp[v] == -1) self(self, v, c);",
      "  };",
      "  for (int i = (int)order.size() - 1; i >= 0; i--)",
      "    if (comp[order[i]] == -1) {",
      "      comps.push_back({});",
      "      paint(paint, order[i], (int)comps.size() - 1);",
      "    }",
      "  return comps;",
      "}",
    }),
  }),
})
