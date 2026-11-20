local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("dfs", {
    t({
      "template <typename G>",
      "pair<vector<int>, vector<int>> dfs(int n, const G &adj, int src) {",
      "  vector<int> order, par(n + 1, 0), vis(n + 1, 0);",
      "  auto go = [&](auto &&self, int u) -> void {",
      "    vis[u] = 1;",
      "    order.push_back(u);",
      "    for (int v : adj[u])",
      "      if (!vis[v]) {",
      "        par[v] = u;",
      "        self(self, v);",
      "      }",
      "  };",
      "  go(go, src);",
      "  return {order, par};",
      "}",
    }),
  }),
})
