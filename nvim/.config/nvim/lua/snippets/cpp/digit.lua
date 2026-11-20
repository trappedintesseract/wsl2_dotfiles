local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("digit", {
    t({
      "template <typename TransF, typename AccF>",
      "long long digit_dp(long long n, int base, int states, int init, TransF next_state, AccF accept) {",
      "  if (n < 0) return 0;",
      "  vector<int> digits;",
      "  for (long long t = n; t > 0; t /= base) digits.push_back((int)(t % base));",
      "  reverse(digits.begin(), digits.end());",
      "  if (digits.empty()) digits.push_back(0);",
      "  int L = (int)digits.size();",
      "  vector<vector<long long>> free_(L + 1, vector<long long>(states, 0));",
      "  for (int st = 0; st < states; st++) free_[L][st] = accept(st) ? 1 : 0;",
      "  for (int pos = L - 1; pos >= 0; pos--)",
      "    for (int st = 0; st < states; st++)",
      "      for (int d = 0; d < base; d++) free_[pos][st] += free_[pos + 1][next_state(st, d)];",
      "  long long ans = 0;",
      "  int st = init;",
      "  for (int pos = 0; pos < L; pos++) {",
      "    for (int d = 0; d < digits[pos]; d++) ans += free_[pos + 1][next_state(st, d)];",
      "    st = next_state(st, digits[pos]);",
      "  }",
      "  if (accept(st)) ans++;",
      "  return ans;",
      "}",
    }),
  }),
})
