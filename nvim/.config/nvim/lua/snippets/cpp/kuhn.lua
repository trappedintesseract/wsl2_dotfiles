local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("kuhn", {
    t({
      "template <typename G>",
      "int kuhn(int n, int m, const G &adj) {",
      "  vector<int> matchR(m + 1, -1);",
      "  auto try_k = [&](auto &&self, int u, vector<int> &used) -> bool {",
      "    for (int v : adj[u]) {",
      "      if (used[v]) continue;",
      "      used[v] = 1;",
      "      if (matchR[v] == -1 || self(self, matchR[v], used)) {",
      "        matchR[v] = u;",
      "        return true;",
      "      }",
      "    }",
      "    return false;",
      "  };",
      "  int matching = 0;",
      "  for (int u = 1; u <= n; u++) {",
      "    vector<int> used(m + 1, 0);",
      "    if (try_k(try_k, u, used)) matching++;",
      "  }",
      "  return matching;",
      "}",
    }),
  }),
})
