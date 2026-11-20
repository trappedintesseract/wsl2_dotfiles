local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("lca", {
    t({
      "struct LCA {",
      "  int LOG;",
      "  vector<vector<int>> up;",
      "  vector<int> depth;",
      "  LCA(int n, const vector<vector<int>> &adj, int root) {",
      "    LOG = 1;",
      "    while ((1 << LOG) <= n) LOG++;",
      "    up.assign(LOG, vector<int>(n + 1, 0));",
      "    depth.assign(n + 1, 0);",
      "    auto go = [&](auto &&self, int u, int p) -> void {",
      "      up[0][u] = p;",
      "      for (int k = 1; k < LOG; k++) up[k][u] = up[k - 1][up[k - 1][u]];",
      "      for (int v : adj[u])",
      "        if (v != p) {",
      "          depth[v] = depth[u] + 1;",
      "          self(self, v, u);",
      "        }",
      "    };",
      "    go(go, root, root);",
      "  }",
      "  int lca(int u, int v) const {",
      "    if (depth[u] < depth[v]) swap(u, v);",
      "    int diff = depth[u] - depth[v];",
      "    for (int k = 0; k < LOG; k++)",
      "      if (diff >> k & 1) u = up[k][u];",
      "    if (u == v) return u;",
      "    for (int k = LOG - 1; k >= 0; k--)",
      "      if (up[k][u] != up[k][v]) { u = up[k][u]; v = up[k][v]; }",
      "    return up[0][u];",
      "  }",
      "  int dist(int u, int v) const { return depth[u] + depth[v] - 2 * depth[lca(u, v)]; }",
      "};",
    }),
  }),
})
