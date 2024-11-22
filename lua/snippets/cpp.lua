local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("cp", fmt([[
  #include <iostream>
  #include <random>
  #include <chrono>
  #include <algorithm>
  #include <string>
  #include <vector>
  #include <set>
  #include <map>
  #include <stack>
  #include <queue>

  #define rep(i, a, b) for (int i = a; i <= b; i++)
  #define per(i, a, b) for (int i = a; i >= b; i--)
  #define db(x) cout << #x << " = " << x << '\n';
  #define db2(x) cout << #x << " = " << x;

  using namespace std;
  using ll = long long;
  using pi = pair<int, int>;

  void solve() {{
    {}
  }}
  int main() {{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int T = 1;
    cin >> T;
    while (T--) {{
      solve();
    }}
  }}
  ]], {
    i(1, "// TODO: implement solution"),
  }))
}

