local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("compress", {
    t({
      "vector<int> compress(const vector<long long> &a, vector<long long> &uniq) {",
      "  uniq = a;",
      "  sort(uniq.begin(), uniq.end());",
      "  uniq.erase(unique(uniq.begin(), uniq.end()), uniq.end());",
      "  vector<int> res(a.size());",
      "  for (int i = 0; i < (int)a.size(); i++)",
      "    res[i] = (int)(lower_bound(uniq.begin(), uniq.end(), a[i]) - uniq.begin());",
      "  return res;",
      "}",
    }),
  }),
})
