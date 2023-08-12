class user {
  String username = '';
  String password = '';
  Map<String, dynamic> spentmoney = {};
  int totalbalance = 0;
  int totalmoneyspent = 0;
  Map<String, dynamic> lasttrans = {};
  setUsername(username) => this.username = username;
  setPassword(password) => this.password = password;
  setTotalbalance(totalbalance) => this.totalbalance = totalbalance;
  setTotalmoneyspent(totalmoneyspent) => this.totalmoneyspent = totalmoneyspent;
  setSpentmoney(spentmoney) => this.spentmoney.addAll(spentmoney);
  setLasttrans(lasttrans) => this.lasttrans.addAll(lasttrans);
  getUsername() {
    return username;
  }

  getPassword() {
    return password;
  }

  Map<String, dynamic> getSpentmoney() {
    return spentmoney;
  }

  getTotalbalance() {
    return totalbalance;
  }

  getTotalmoneyspent() {
    return totalmoneyspent;
  }

  Map<String, dynamic> getLasttrans() {
    return lasttrans;
  }
}
