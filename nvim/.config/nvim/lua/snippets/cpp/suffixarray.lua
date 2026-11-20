local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("suffixarray", {
    t({
      "vector<int> suffix_array(const string &s) {",
      "  int n = (int)s.size();",
      "  vector<int> sa(n), rank(n);",
      "  iota(sa.begin(), sa.end(), 0);",
      "  for (int i = 0; i < n; i++) rank[i] = (unsigned char)s[i];",
      "  for (int k = 1;; k <<= 1) {",
      "    auto cmp = [&](int a, int b) {",
      "      if (rank[a] != rank[b]) return rank[a] < rank[b];",
      "      int ra = a + k < n ? rank[a + k] : -1;",
      "      int rb = b + k < n ? rank[b + k] : -1;",
      "      return ra < rb;",
      "    };",
      "    sort(sa.begin(), sa.end(), cmp);",
      "    vector<int> nr(n);",
      "    nr[sa[0]] = 0;",
      "    for (int i = 1; i < n; i++) nr[sa[i]] = nr[sa[i - 1]] + (cmp(sa[i - 1], sa[i]) ? 1 : 0);",
      "    rank = nr;",
      "    if (rank[sa[n - 1]] == n - 1) break;",
      "  }",
      "  return sa;",
      "}",
      "",
      "vector<int> lcp_array(const string &s, const vector<int> &sa) {",
      "  int n = (int)s.size();",
      "  vector<int> rank(n), lcp(max(0, n - 1), 0);",
      "  for (int i = 0; i < n; i++) rank[sa[i]] = i;",
      "  int h = 0;",
      "  for (int i = 0; i < n; i++) {",
      "    if (rank[i] > 0) {",
      "      int j = sa[rank[i] - 1];",
      "      while (i + h < n && j + h < n && s[i + h] == s[j + h]) h++;",
      "      lcp[rank[i] - 1] = h;",
      "      if (h > 0) h--;",
      "    }",
      "  }",
      "  return lcp;",
      "}",
    }),
  }),
})
