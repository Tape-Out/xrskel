# xrskel

息壤（[`xirang`](https://github.com/Tape-Out/xirang)）建新仓用的模板。

`ran new <name> -t <template>` 从这里铺骨架。模板随息壤发版自动带上最新的一份，
不必单独安装。

| 模板 | 用在哪 |
| :--: | :-- |
| `ip/regmap` | 外设 IP，带寄存器图 |
| `ip/plain` | 外设 IP，控制口不对外露 |
| `lib` | 库，只贡献源码 |
| `asm` | 装配，有 `instances` |

## 两条落盘规矩

`.in` 后缀落盘时脱掉；路径里 `dot.` 开头的那一段还原成 `.`。两者都是为了让模板
在仓里不被当成真货：`ip.yaml` 会被发现成包，`.github/` 会触发组织的门禁。

占位符只认 `{{name}}` 这种形式，且**前面不是 `$`**——GitHub Actions 的 `${{ }}` 不动。
可用的有 `name` `Name` `NAME` `org` `year`。

## License

Apache License 2.0。模板铺出来的仓按 `skel.yaml` 里的 `include` 取 Mulan PSL v2 或 Apache-2.0。
