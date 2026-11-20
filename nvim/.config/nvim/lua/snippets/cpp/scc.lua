local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("scc", {
    t({
      "template <typename G>",
      "vector<vector<int>> scc(int n, const G &adj) {",
      "  vector<int> num(n + 1, -1), low(n + 1), stk, on(n + 1, 0);",
      "  vector<vector<int>> comps;",
      "  int timer = 0;",
      "  auto go = [&](auto &&self, int u) -> void {",
      "    num[u] = low[u] = timer++;",
      "    stk.push_back(u);",
      "    on[u] = 1;",
      "    for (int v : adj[u]) {",
      "      if (num[v] == -1) {",
      "        self(self, v);",
      "        low[u] = min(low[u], low[v]);",
      "      } else if (on[v])",
      "        low[u] = min(low[u], num[v]);",
      "    }",
      "    if (low[u] == num[u]) {",
      "      comps.push_back({});",
      "      while (true) {",
      "        int v = stk.back();",
      "        stk.pop_back();",
      "        on[v] = 0;",
      "        comps.back().push_back(v);",
      "        if (v == u) break;",
      "      }",
      "    }",
      "  };",
      "  for (int u = 1; u <= n; u++)",
      "    if (num[u] == -1) go(go, u);",
      "  return comps;",
      "}",
    }),
  }),
})
