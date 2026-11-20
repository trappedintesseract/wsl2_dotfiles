local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("euler", {
    t({
      "template <typename G>",
      "vector<int> euler_path(int n, const G &adj, int start) {",
      "  vector<int> it(n + 1, 0), path, st = {start};",
      "  while (!st.empty()) {",
      "    int u = st.back();",
      "    if (it[u] < (int)adj[u].size())",
      "      st.push_back(adj[u][it[u]++]);",
      "    else {",
      "      path.push_back(u);",
      "      st.pop_back();",
      "    }",
      "  }",
      "  reverse(path.begin(), path.end());",
      "  return path;",
      "}",
    }),
  }),
})
