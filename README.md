# xrskel

息壤（[`xirang`](https://github.com/Tape-Out/xirang)）建新仓用的模板。
`ran new <name> -t <template>` 从这里铺骨架；模板随息壤发版自动带上最新的一份。

| 模板 | 用在哪 |
| :--: | :-- |
| `ip/regmap` | 外设 IP，带寄存器图 |
| `ip/plain` | 外设 IP，控制口不对外露 |
| `lib` | 库，只贡献源码 |
| `asm` | 装配，有 `instances` |

## 两条落盘规矩

`.in` 后缀落盘时脱掉，路径里 `dot.` 开头的那一段还原成 `.`。两者都是为了让模板
在这个仓里不被当成真货：`ip.yaml` 会被发现成包，`.github/` 会触发组织的门禁。

占位符写成 `{{name}}`，前面带 `$` 的不算（那是 GitHub Actions）。可用的有
`name` `Name` `NAME` `org` `year`。

## License

任选其一：

- [MIT](LICENSE-MIT)
- [Apache 2.0](LICENSE-APACHE)
- [木兰宽松许可证 第2版](LICENSE-MULAN)

`SPDX-License-Identifier: MIT OR Apache-2.0 OR MulanPSL-2.0`

除非另行说明，你提交的贡献按上述三者同时授权，不附加其他条件。
