local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("sack", {
    t({
      "template <typename G>",
      "vector<long long> dsu_on_tree(int n, const G &adj, const vector<int> &col, int root) {",
      "  vector<int> sz(n + 1), heavy(n + 1, 0);",
      "  vector<int> cnt(*max_element(col.begin() + 1, col.end()) + 1, 0);",
      "  long long distinct = 0;",
      "  vector<long long> ans(n + 1);",
      "  auto dfs_sz = [&](auto &&self, int u, int p) -> void {",
      "    sz[u] = 1;",
      "    for (int v : adj[u])",
      "      if (v != p) {",
      "        self(self, v, u);",
      "        sz[u] += sz[v];",
      "        if (heavy[u] == 0 || sz[v] > sz[heavy[u]]) heavy[u] = v;",
      "      }",
      "  };",
      "  auto addsub = [&](auto &&self, int u, int p, int d) -> void {",
      "    int c = col[u];",
      "    if (d == 1) { if (cnt[c]++ == 0) distinct++; }",
      "    else if (--cnt[c] == 0) distinct--;",
      "    for (int v : adj[u])",
      "      if (v != p) self(self, v, u, d);",
      "  };",
      "  auto dfs = [&](auto &&self, int u, int p, bool keep) -> void {",
      "    for (int v : adj[u])",
      "      if (v != p && v != heavy[u]) self(self, v, u, false);",
      "    if (heavy[u]) self(self, heavy[u], u, true);",
      "    for (int v : adj[u])",
      "      if (v != p && v != heavy[u]) addsub(addsub, v, u, 1);",
      "    if (cnt[col[u]]++ == 0) distinct++;",
      "    ans[u] = distinct;",
      "    if (!keep) addsub(addsub, u, p, -1);",
      "  };",
      "  dfs_sz(dfs_sz, root, 0);",
      "  dfs(dfs, root, 0, true);",
      "  return ans;",
      "}",
    }),
  }),
})
