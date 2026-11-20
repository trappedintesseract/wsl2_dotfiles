local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bridges", {
    t({
      "template <typename G>",
      "pair<vector<pair<int, int>>, vector<int>> find_cuts(int n, const G &adj) {",
      "  vector<int> tin(n + 1, -1), low(n + 1), is_art(n + 1, 0);",
      "  vector<pair<int, int>> bridges;",
      "  int timer = 0;",
      "  auto go = [&](auto &&self, int u, int p) -> void {",
      "    tin[u] = low[u] = timer++;",
      "    int kids = 0;",
      "    for (int v : adj[u]) {",
      "      if (v == p) continue;",
      "      if (tin[v] != -1)",
      "        low[u] = min(low[u], tin[v]);",
      "      else {",
      "        self(self, v, u);",
      "        low[u] = min(low[u], low[v]);",
      "        if (low[v] > tin[u]) bridges.push_back({min(u, v), max(u, v)});",
      "        if (p != -1 && low[v] >= tin[u]) is_art[u] = 1;",
      "        kids++;",
      "      }",
      "    }",
      "    if (p == -1 && kids > 1) is_art[u] = 1;",
      "  };",
      "  for (int u = 1; u <= n; u++)",
      "    if (tin[u] == -1) go(go, u, -1);",
      "  sort(bridges.begin(), bridges.end());",
      "  return {bridges, is_art};",
      "}",
    }),
  }),
})
