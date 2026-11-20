local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("reroot", {
    t({
      "template <typename G>",
      "pair<vector<long long>, vector<long long>> reroot(int n, const G &adj, int root) {",
      "  vector<long long> down(n + 1, 0), up(n + 1, 0);",
      "  auto go1 = [&](auto &&self, int u, int p) -> void {",
      "    for (int v : adj[u])",
      "      if (v != p) {",
      "        self(self, v, u);",
      "        down[u] = max(down[u], down[v] + 1);",
      "      }",
      "  };",
      "  go1(go1, root, 0);",
      "  auto go2 = [&](auto &&self, int u, int p) -> void {",
      "    long long b1 = -1, b2 = -1;",
      "    int who = 0;",
      "    for (int v : adj[u])",
      "      if (v != p) {",
      "        if (down[v] > b1) { b2 = b1; b1 = down[v]; who = v; }",
      "        else if (down[v] > b2) b2 = down[v];",
      "      }",
      "    for (int v : adj[u])",
      "      if (v != p) {",
      "        long long sib = (v == who ? b2 : b1);",
      "        up[v] = max(up[u], sib + 1) + 1;",
      "        self(self, v, u);",
      "      }",
      "  };",
      "  go2(go2, root, 0);",
      "  return {down, up};",
      "}",
    }),
  }),
})
