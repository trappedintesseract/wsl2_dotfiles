local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("lis", {
    t({
      "template <typename T>",
      "int lis_length(const vector<T> &a) {",
      "  vector<T> tails;",
      "  for (const T &x : a) {",
      "    auto it = lower_bound(tails.begin(), tails.end(), x);",
      "    if (it == tails.end()) tails.push_back(x);",
      "    else *it = x;",
      "  }",
      "  return (int)tails.size();",
      "}",
      "",
      "template <typename T>",
      "vector<T> lis_sequence(const vector<T> &a) {",
      "  vector<T> tails;",
      "  vector<int> tailIdx, parent(a.size(), -1);",
      "  for (int i = 0; i < (int)a.size(); i++) {",
      "    int pos = (int)(lower_bound(tails.begin(), tails.end(), a[i]) - tails.begin());",
      "    if (pos == (int)tails.size()) {",
      "      tails.push_back(a[i]);",
      "      tailIdx.push_back(i);",
      "    } else {",
      "      tails[pos] = a[i];",
      "      tailIdx[pos] = i;",
      "    }",
      "    parent[i] = pos > 0 ? tailIdx[pos - 1] : -1;",
      "  }",
      "  vector<T> res;",
      "  for (int i = tailIdx.empty() ? -1 : tailIdx.back(); i != -1; i = parent[i]) res.push_back(a[i]);",
      "  reverse(res.begin(), res.end());",
      "  return res;",
      "}",
    }),
  }),
})
