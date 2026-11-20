local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("centroid", {
    t({
      "template <typename G, typename F>",
      "void centroid_decompose(int n, const G &adj, int root, F &&work) {",
      "  vector<int> dead(n + 1, 0), sub(n + 1);",
      "  auto calc = [&](auto &&self, int u, int p) -> int {",
      "    sub[u] = 1;",
      "    for (int v : adj[u])",
      "      if (v != p && !dead[v]) sub[u] += self(self, v, u);",
      "    return sub[u];",
      "  };",
      "  auto find_centroid = [&](auto &&self, int u, int p, int tot) -> int {",
      "    for (int v : adj[u])",
      "      if (v != p && !dead[v] && sub[v] > tot / 2) return self(self, v, u, tot);",
      "    return u;",
      "  };",
      "  auto go = [&](auto &&self, int u, int depth) -> void {",
      "    calc(calc, u, 0);",
      "    int c = find_centroid(find_centroid, u, 0, sub[u]);",
      "    dead[c] = 1;",
      "    work(c, depth);",
      "    for (int v : adj[c])",
      "      if (!dead[v]) self(self, v, depth + 1);",
      "  };",
      "  go(go, root, 0);",
      "}",
    }),
  }),
})
