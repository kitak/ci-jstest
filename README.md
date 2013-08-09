# testem と altria を使ったJSのテスト環境(まだ途中)

## マニフェストを適用することで導入されるソフトウェア群
- node.js (testemを動かすために必要)
- ruby (altriaを動かすために必要)
- testem (jsのテストランナー)
- Xvfb (仮想ディスプレイ、ブラウザを動かすために必要)
- Firefox, Chrome (ブラウザ)
- altria (カジュアルなCIツール)

## 導入方法 
Vagrantが手元に用意されている前提です。
```
# manifest と Vagrantfile を取得
git clone https://github.com/kitak/kitak-puppet.git
git clone https://github.com/kitak/ci-jstest

# 仮想マシンの作成
cd ci-jstest
vagrant up

# マニフェストの適用
vagrant ssh

## ここから先はVM上での操作です
sudo gem install puppet --no-ri --no-rdoc 
cd /manifest
sudo puppet apply --modulepath=modules:roles manifests/ci_jstest.pp --debug
```

## 使い方
### testem を常時起動して使ってみる
後から書く

### testem ciコマンドを叩いてみる
```
cd ci-jstest
vagrant ssh
sudo su - ci
cd ~
```

適当にテストファイルを用意しましょう(ファイル名 hello_spec.js)
```javascript
var hello = function() {
  return 'hello world';
};

describe('hello', function() {
  it('should say hello', function() {
    expect(hello()).toBe('hello world');
  })  
});
```

仮想ディスプレイを立ち上げる
```
Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
```

テストを走らせる
```
testem ci
```

Chrome, Firefoxそれぞれでテストが通っていることが確認できます。

### altria から走らせてみる
あとから書く

## やり残していること 
- [ ] PhantomJSの導入
- [ ] altriaのgit連携（hookをつかって、その都度テストを走らせる）
- [ ] altriaとtestemの連携
- [ ] テストだけでなく、js_hintで文法チェックをかける
- [ ] testem.ymlを使ってプロジェクトごとにテストを走らせる
- [ ] 仮想ディスプレイの起動スクリプトを用意する 
- [ ] 結局、IEをどうするか(testemを起動しておいてWindowsマシンからアクセスしてもらう？ Windows仮想マシンをVagrant経由で起動してやりとりさせる？)