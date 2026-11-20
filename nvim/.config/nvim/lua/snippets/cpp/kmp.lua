local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("kmp", {
    t({
      "vector<int> prefix_function(const string &s) {",
      "  int n = (int)s.size();",
      "  vector<int> pi(n, 0);",
      "  for (int i = 1; i < n; i++) {",
      "    int j = pi[i - 1];",
      "    while (j > 0 && s[i] != s[j]) j = pi[j - 1];",
      "    if (s[i] == s[j]) j++;",
      "    pi[i] = j;",
      "  }",
      "  return pi;",
      "}",
      "",
      "vector<int> kmp_search(const string &text, const string &pat) {",
      "  if (pat.empty()) return {};",
      "  vector<int> pi = prefix_function(pat), res;",
      "  int j = 0;",
      "  for (int i = 0; i < (int)text.size(); i++) {",
      "    while (j > 0 && text[i] != pat[j]) j = pi[j - 1];",
      "    if (text[i] == pat[j]) j++;",
      "    if (j == (int)pat.size()) {",
      "      res.push_back(i - j + 1);",
      "      j = pi[j - 1];",
      "    }",
      "  }",
      "  return res;",
      "}",
    }),
  }),
})
