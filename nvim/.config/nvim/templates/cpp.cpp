// Problem: $(PROBLEM)
// Contest: $(CONTEST)
// Judge: $(JUDGE)
// URL: $(URL)
// Memory Limit: $(MEMLIM) MB
// Time Limit: $(TIMELIM) ms
// Start: $(DATE)

#include <sys/types.h>

#pragma GCC optimize("Ofast")
#pragma GCC target("sse,sse2,sse3,ssse3,sse4,popcnt,abm,mmx,avx,avx2,fma")
#pragma GCC optimize("unroll-loops")

#include <bits/stdc++.h>

#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>

using namespace std;
using namespace __gnu_pbds;

// ================================================================
// PBDS
// ================================================================

#define ordered_set                                                            \
  tree<int, null_type, less<int>, rb_tree_tag,                                 \
       tree_order_statistics_node_update>

// ================================================================
// Types
// ================================================================

typedef long long ll;
typedef long double ld;

typedef pair<int, int> p32;
typedef pair<ll, ll> p64;
typedef pair<double, double> pdd;

typedef vector<ll> v64;
typedef vector<int> v32;

typedef vector<vector<int>> vv32;
typedef vector<vector<ll>> vv64;

typedef vector<vector<p64>> vvp64;
typedef vector<p64> vp64;
typedef vector<p32> vp32;

typedef map<int, int> m32;
typedef map<ll, ll> m64;

// ================================================================
// Constants
// ================================================================

double eps = 1e-12;
double pi = acos(-1);

// ================================================================
// Macros
// ================================================================

#define forn(i, e) for (ll i = 0; i < e; i++)
#define forsn(i, s, e) for (ll i = s; i < e; i++)
#define rforn(i, s) for (ll i = s; i >= 0; i--)
#define rforsn(i, s, e) for (ll i = s; i >= e; i--)

#define ln "\n"

#define dbg(x) cout << #x << " = " << x << ln

#define mp make_pair
#define pb push_back
#define fi first
#define se second

#define INF 2e18

#define fast_cin()                                                             \
  ios_base::sync_with_stdio(false);                                            \
  cin.tie(NULL);                                                               \
  cout.tie(NULL)

#define all(x) (x).begin(), (x).end()
#define sz(x) ((ll)(x).size())

// ================================================================
// Debug
// ================================================================

#ifndef ONLINE_JUDGE

template <typename T> void __p(T a) { cerr << a; }

template <typename T, typename F> void __p(pair<T, F> a) {
  cerr << "{";
  __p(a.first);
  cerr << ",";
  __p(a.second);
  cerr << "}";
}

template <typename T> void __p(vector<T> a) {
  cerr << "{";
  for (auto it = a.begin(); it < a.end(); it++)
    __p(*it), cerr << ",}"[it + 1 == a.end()];
}

template <typename T> void __p(set<T> a) {
  cerr << "{";
  for (auto it = a.begin(); it != a.end();) {
    __p(*it);
    cerr << ",}"[++it == a.end()];
  }
}

template <typename T> void __p(multiset<T> a) {
  cerr << "{";
  for (auto it = a.begin(); it != a.end();) {
    __p(*it);
    cerr << ",}"[++it == a.end()];
  }
}

template <typename T, typename F> void __p(map<T, F> a) {
  cerr << "{\n";
  for (auto it = a.begin(); it != a.end(); ++it) {
    __p(it->first);
    cerr << ": ";
    __p(it->second);
    cerr << "\n";
  }
  cerr << "}\n";
}

template <typename T, typename... Arg> void __p(T a1, Arg... a) {
  __p(a1);
  __p(a...);
}

template <typename Arg1> void __f(const char *name, Arg1 &&arg1) {
  cerr << name << " : ";
  __p(arg1);
  cerr << endl;
}

template <typename Arg1, typename... Args>
void __f(const char *names, Arg1 &&arg1, Args &&...args) {
  int bracket = 0, i = 0;

  for (;; i++) {
    if (names[i] == ',' && bracket == 0)
      break;
    else if (names[i] == '(')
      bracket++;
    else if (names[i] == ')')
      bracket--;
  }

  const char *comma = names + i;

  cerr.write(names, comma - names) << " : ";
  __p(arg1);
  cerr << " | ";

  __f(comma + 1, args...);
}

#define trace(...)                                                             \
  cerr << "Line:" << __LINE__ << " ", __f(#__VA_ARGS__, __VA_ARGS__)

#else

#define trace(...)
#define error(...)

#endif

// ================================================================
// Random
// ================================================================

mt19937 RNG(chrono::steady_clock::now().time_since_epoch().count());

#define SHUF(v) shuffle(all(v), RNG);

// ================================================================
// Miscellaneous
// ================================================================

#define cz(it) cout << "Case #" << it << ":" << '\n'

#define int ll

// ================================================================
// Solve
// ================================================================

void solve(int it) {}

// ================================================================
// Main
// ================================================================

signed main() {
  fast_cin();

  // freopen("input.txt", "r", stdin);
  // freopen("output.txt", "w", stdout);

  ll tc;
  cin >> tc;

  for (int it = 1; it <= tc; it++) {
    solve(it);
  }

  cerr << "time taken : " << (float)clock() * 1000 / CLOCKS_PER_SEC << " ms"
       << endl;

  return 0;
}
