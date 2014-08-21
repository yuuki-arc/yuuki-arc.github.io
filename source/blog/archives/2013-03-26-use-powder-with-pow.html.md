---
title: powder で pow を手軽に扱う
date: 2013-03-26 00:35 JST
tags: powder, pow, Ruby on Rails
---

[前回のエントリ](/blog/2013/03/24/use-pow-rbenv-on-rack-server/)で pow をインストールしましたので、今回は powder を入れてさらに便利な環境を整えます。

インストールは gem であれば簡単にできます。

```
$ gem install powder
$ rbenv rehash
```

これだけでインストール完了です。  
使い方はpowderのヘルプをみるとだいたい分かるかと思います。

## powder コマンド一覧

```
$ powder
Tasks:
powder always_restart  # Always restart current pow
powder applog          # Tails in current app
powder cleanup         # Clean up invalid symbolic link
powder config          # Shows current pow configuration
powder debug           # Open a debug session
powder default         # Set this app as default
powder dev             # Run pow with RAILS_ENV=development
powder dev             # An alias to development
powder down            # Disable pow
powder env             # Pass an arbitrary environment variable to pow
powder env_reset       # Remove all custom environment variables
powder help [TASK]     # Describe available tasks or one specific task
powder host            # Updates hosts file to map pow domains to 127.0.0.1
powder install         # Installs pow
powder link            # Link a pow
powder list            # List current pows
powder log             # Tails the Pow log
powder no_restarts     # Reset this app&#39;s restart settings
powder open            # Open a pow in the browser
powder portmap PORT    # Map a port to an app
powder prod            # An alias to production
powder production      # Run pow with RAILS_ENV=production
powder remove          # An alias to Unlink (deprecated)
powder respawn         # Restart the pow process
powder restart         # Restart current pow
powder start           # An alias to up
powder status          # Shows current pow status
powder stop            # An alias to down
powder test            # Run pow with RAILS_ENV=test
powder un_default      # remove current default app
powder unhost          # Removes pow domains from hostfile
powder uninstall       # Uninstalls pow
powder unlink          # Unlink a pow app
powder up              # Enable pow
powder version         # Shows the version
```


## powder コマンドの詳細ヘルプ

例えば `powder down` のコマンドを調べたいときは次のようにします。

```
$ powder help down
Usage:
powder down
Disable pow
```
